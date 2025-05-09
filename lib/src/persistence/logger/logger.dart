// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';
import 'package:stack_trace/stack_trace.dart';

/// This class handles all the operations
/// related to Error Logging.
///
/// Accepts a [shareLogsWithLM] boolean as a parameter
/// which determines whether the logs should be stored in LocalDB
/// and shared with LM later or not.
///
/// Calls the errorHandler method for the client if it is not null.
class LMFeedLogger {
  bool isInitialised = false;

  /// LogDBHandler instance to handle DB operations
  LogDBHandler? logDBHandler;

  /// shareLogsWithLM is a boolean value which determines whether the logs
  /// should be stored in LocalDB and shared with LM or not
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

  // shareLogsWithLM is a boolean value which determines whether the logs
  // should be shared with LM or not
  // Must be called only once per app lifecycle
  Future<LMResponse<void>> initialise(
      {required InitiateLoggerRequest initiateLoggerRequest}) async {
    this.initiateLoggerRequest = initiateLoggerRequest;
    // Initialising LogDBHandler with all the neccessary schemas
    logDBHandler = LogDBHandler(loggerBoxName: 'lm_logger');

    LMResponse response = await logDBHandler!.init();

    if (response.success) {
      isInitialised = true;
    }

    return response;
  }

  // Creates a InsertLogRequest object and calls insertLog method
  // of LogDBHandler
  Future<void> _insertLogs(LMStackTrace stackTrace, Severity severity) async {
    if (!checkIfLoggerInitialised()) {
      return;
    }
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

    LMSDKMeta lmSdkMeta = (LMSDKMetaBuilder()
          ..dataLayerVersion(feedSDKVersion)
          ..coreVersion(initiateLoggerRequest!.coreVersion))
        .build();

    String severityString = severityMap[severity]!;

    InsertLogRequest insertLogRequest = (InsertLogRequestBuilder()
          ..stackTrace(stackTrace)
          ..sdkMeta(lmSdkMeta)
          ..severity(severityString)
          ..timestamp(currentTimestamp))
        .build();
    // insert the log in DB
    await logDBHandler!.insertLog(insertLogRequest);
  }

  // Gets all the logs from the database
  // Maps the list of logs with DeviceDetails
  // Creates a PushLogRequest object and calls pushLogs method
  // If the response is success, then deletes the logs from the database
  // upto the current timestamp
  Future<LMResponse<void>> _pushLogs() async {
    if (!checkIfLoggerInitialised()) {
      return LMResponse(
          success: false, errorMessage: 'LMFeedLogger not initialised');
    }
    int currentTimeStamp = DateTime.now().millisecondsSinceEpoch;

    LMResponse<GetLogResponse> response =
        logDBHandler!.getLogs(currentTimeStamp);

    if (!response.success) {
      return response;
    }

    GetLogResponse getLogResponse = response.data!;

    List<LMLogBuilder> lmLogsBuilderList = getLogResponse.lmLogsBuilder;

    if (lmLogsBuilderList.isEmpty) {
      return LMResponse(success: true);
    }

    // Builder for DeviceDetails
    // To store device details
    DeviceDetailsBuilder deviceDetailsBuilder = DeviceDetailsBuilder();

    // To check whether the device is connected to wifi or not
    bool isOnWifi;

    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      isOnWifi = true;
    } else {
      isOnWifi = false;
    }
    Size size = PlatformDispatcher.instance.views.first.display.size;
    double width = size.width;
    double height = size.height;
    deviceDetailsBuilder
      ..screenHeight(height.toInt())
      ..screenWidth(width.toInt());
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
        ..wifi(isOnWifi);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceDetailsBuilder
        ..os('ios')
        ..wifi(isOnWifi);

      if (iosDeviceInfo.systemVersion != null) {
        deviceDetailsBuilder.versionOS(iosDeviceInfo.systemVersion);
      }

      if (iosDeviceInfo.name != null) {
        deviceDetailsBuilder.deviceName(iosDeviceInfo.name);
      }
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

    LMResponse pushResponse = await SDKApplication.instance
        .getLoggerApi()
        .pushLogs(request: pushLogRequest);

    // If response is success
    // Clear logs from DB
    // And return the response
    if (pushResponse.success) {
      ClearLogRequest clearLogRequest =
          (ClearLogRequestBuilder()..timestamp(currentTimeStamp)).build();
      _clearLogs(clearLogRequest);
    }
    return pushResponse;
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

      _insertLogs(lmStackTrace, errorSeverity);
    }
    // Call error handling callback for client
    initiateLoggerRequest!.onErrorHandler(exception, stackTrace);
  }

  // Deletes all the logs upto the timestamp passed as parameter
  // Wrapper function for LogDBHandler
  Future<LMResponse<void>> _clearLogs(ClearLogRequest clearLogRequest) async {
    if (!checkIfLoggerInitialised()) {
      return LMResponse(success: false, errorMessage: "Logger not initilized");
    }
    return await logDBHandler!.clearLogs(clearLogRequest);
  }

  // This function should be called on
  // 1. App launch
  // 2. App kill
  // Fetches all the logs from the DB
  // push the logs to LM
  // Deletes the logs from DB
  Future<void> flushLogs() async {
    await _pushLogs();
  }

  /// used to clear logs
  Future<LMResponse<void>> clearAllLogs() async {
    if (!checkIfLoggerInitialised()) {
      return LMResponse.error(errorMessage: "Logger not initilized");
    }
    return await logDBHandler!.clearAllLogs();
  }
}
