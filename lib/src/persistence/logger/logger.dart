import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/logger/schema/log_db.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';
import 'package:realm/realm.dart' as realm;
import 'package:stack_trace/stack_trace.dart';

// This class handles all the operations
// related to Error Logging
// Accepts a [shareLogsWithLM] boolean as parameter
// which determines whether the logs should be stored in LocalDB
// and shared with LM later or not
// Calls the errorHandler method for client if it is not null
class LMFeedLogger {
  // LogDBHandler instance to handle DB operations
  LogDBHandler? logDBHandler;
  // shareLogsWithLM is a boolean value which determines whether the logs
  // should be stored in LocalDB and shared with LM or not
  InitiateLoggerRequest? initiateLoggerRequest;

  LMFeedLogger._internal();

  static LMFeedLogger? _instance;

  static LMFeedLogger get instance => _instance ??= LMFeedLogger._internal();

  // Checks if the logger is initialised or not
  // Returns true if initialised
  bool checkIfLoggerInitialised() {
    if (initiateLoggerRequest == null || logDBHandler == null) {
      return false;
    }
    return true;
  }

  // Creates a new realm instance with all the neccessary schemas
  // and initialises the logDBHandler
  // shareLogsWithLM is a boolean value which determines whether the logs
  // should be shared with LM or not
  // Must be called only once per app lifecycle
  void initialise({required InitiateLoggerRequest initiateLoggerRequest}) {
    this.initiateLoggerRequest = initiateLoggerRequest;
    // Initialising LogDBHandler with all the neccessary schemas
    logDBHandler = LogDBHandler(
        config: realm.Configuration.local([
      StackTraceDBModel.schema,
      SDKMetaDBModel.schema,
      LogDBModel.schema
    ]));
  }

  // Creates a InsertLogRequest object and calls insertLog method
  // of LogDBHandler
  Future<void> insertLogs(LMStackTrace stackTrace, Severity severity) async {
    if (!checkIfLoggerInitialised()) {
      return;
    }
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

    LMSDKMeta lmSdkMeta = (LMSDKMetaBuilder()
          ..middlewareVersion(feedSDKVersion)
          ..sampleAppVersion(initiateLoggerRequest!.sampleAppVersion)
          ..uiVersion(initiateLoggerRequest!.uiVersion))
        .build();

    String severityString = severityMap[severity]!;

    InsertLogRequest insertLogRequest = (InsertLogRequestBuilder()
          ..stackTrace(stackTrace)
          ..sdkMeta(lmSdkMeta)
          ..severity(severityString)
          ..timestamp(currentTimestamp))
        .build();
    // insert the log in DB
    logDBHandler!.insertLog(insertLogRequest);
  }

  // Gets all the logs from the database
  // Maps the list of logs with DeviceDetails
  // Creates a PushLogRequest object and calls pushLogs method
  // If the response is success, then deletes the logs from the database
  // upto the current timestamp
  Future<PushLogResponse> pushLogs() async {
    if (!checkIfLoggerInitialised()) {
      return PushLogResponse(
          success: false, errorMessage: 'LMFeedLogger not initialised');
    }
    int currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
    PushLogResponse response;

    GetLogResponse getLogResponse = logDBHandler!.getLogs(currentTimeStamp);

    List<LMLogBuilder> lmLogsBuilderList = getLogResponse.lmLogsBuilder;

    if (lmLogsBuilderList.isEmpty) {
      return PushLogResponse(success: true);
    }

    // Builder for DeviceDetails
    // To store device details
    DeviceDetailsBuilder deviceDetailsBuilder = DeviceDetailsBuilder();

    // To check whether the device is connected to wifi or not
    bool isOnWifi;

    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi) {
      isOnWifi = true;
    } else {
      isOnWifi = false;
    }

    // To store device details
    // OS [Android or iOS]
    // OS Version
    // Device Name
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceDetailsBuilder
        ..os('android')
        ..versionOS(androidDeviceInfo.version.release)
        ..deviceName(androidDeviceInfo.model)
        ..screenHeight(androidDeviceInfo.displayMetrics.heightPx.toInt())
        ..screenWidth(androidDeviceInfo.displayMetrics.widthPx.toInt())
        ..wifi(isOnWifi);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceDetailsBuilder
        ..os('ios')
        ..versionOS(iosDeviceInfo.systemVersion)
        ..deviceName(iosDeviceInfo.name)
        ..wifi(isOnWifi);
    }

    DeviceDetails deviceMeta = deviceDetailsBuilder.build();

    // Mapping LMLogBuilder list with Device Details
    // Creating LMLog list by calling build method
    List<LMLog> lmLogList = lmLogsBuilderList.map((e) {
      LMLog lmLog = (e..deviceMeta(deviceMeta)).build();
      return lmLog;
    }).toList();

    PushLogRequest pushLogRequest =
        (PushLogRequestBuilder()..logs(lmLogList)).build();

    response = await SDKApplication.instance
        .getLoggerApi()
        .pushLogs(request: pushLogRequest);

    // If response is success
    // Clear logs from DB
    // And return the response
    if (response.success) {
      ClearLogRequest clearLogRequest =
          (ClearLogRequestBuilder()..timestamp(currentTimeStamp)).build();
      clearLogs(clearLogRequest);
    }
    return response;
  }

  // Handles the exception
  // Calls the errorHandler method for client if it is not null
  // If shareLogsWithLM is true, then calls insertLogs method
  void handleException(Exception exception, StackTrace stackTrace,
      {Severity errorSeverity = Severity.ERROR}) {
    // If logger is not initialised, then do nothing
    if (!checkIfLoggerInitialised()) {
      return;
    }

    // If the severity of the error is not greater than or equal to the
    // logLevel set by the LMFeedClient, then do nothing
    if (!checkSeverityForLoggingErros(
        errorSeverity: errorSeverity,
        logLevel: initiateLoggerRequest!.logLevel)) {
      return;
    }

    if (initiateLoggerRequest!.shareLogsWithLM) {
      // Convert the stacktrace to string
      Chain stackChain = Chain.forTrace(stackTrace);

      String stackChainString = stackChain.toString();

      LMStackTrace lmStackTrace = (LMStackTraceBuilder()
            ..stack(stackChainString)
            ..exception(exception.toString()))
          .build();

      insertLogs(lmStackTrace, errorSeverity);
    }
    // Call error handling callback for client
    initiateLoggerRequest!.onErrorHandler(exception, stackTrace);
  }

  // Deletes all the logs upto the timestamp passed as parameter
  // Wrapper function for LogDBHandler
  void clearLogs(ClearLogRequest clearLogRequest) {
    if (!checkIfLoggerInitialised()) {
      return;
    }
    logDBHandler!.clearLogs(clearLogRequest);
  }

  // This function should be called on
  // 1. App launch
  // 2. App kill
  // Fetches all the logs from the DB
  // push the logs to LM
  // Deletes the logs from DB
  Future<void> flushLogs() async {
    await pushLogs();
  }
}
