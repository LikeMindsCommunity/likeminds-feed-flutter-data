import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/schema/log_db.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';

// This class handles all the DB operations
// related to Error Logging
class LogDBHandler {
  final String loggerBoxName;
  late Box<LMLogDB> loggerBox;

  LogDBHandler({required this.loggerBoxName});

  // Initializes the DB
  Future<LMResponse<void>> init() async {
    try {
      Hive.registerAdapter(LMLogDBAdapter());
      loggerBox = await Hive.openBox<LMLogDB>(loggerBoxName);

      if (loggerBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: 'Failed to open box');
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Accepts [InsertLogRequest] object as parameter
  // Creates a LMLogDBModel object and inserts it in the DB
  Future<LMResponse<void>> insertLog(InsertLogRequest request) async {
    try {
      LMStackTraceDB stackTraceRO = LMStackTraceDB(
          exception: request.stackTrace.exception,
          trace: request.stackTrace.stack);

      LMSDKMetaDB sdkMetaRO = LMSDKMetaDB(
          sampleAppVersion: request.sdkMeta?.sampleAppVersion ?? '',
          uiVersion: request.sdkMeta?.uiVersion ?? '',
          middlewareVersion: request.sdkMeta?.middlewareVersion ?? '');

      await loggerBox.put(
          request.timestamp,
          LMLogDB(
              timestamp: request.timestamp,
              stackTrace: stackTraceRO,
              sdkMeta: sdkMetaRO,
              severity: request.severity));

      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  // Returns a list of LMLogDBModel objects
  // which are older than the timestamp passed as parameter
  LMResponse<GetLogResponse> getLogs(int timestamp) {
    try {
      Iterable<LMLogDB> result = loggerBox.valuesBetween(endKey: timestamp);

      // Converting LMLogDBModel to LMLog while
      // Mapping LMLog list with Device Details
      List<LMLogBuilder> lmLogBuilderList = result.map((e) {
        LMStackTrace stackTrace = (LMStackTraceBuilder()
              ..exception(e.stackTrace?.exception ?? "")
              ..stack(e.stackTrace?.trace ?? ""))
            .build();

        // Create instance of LMSDKMeta
        LMSDKMeta sdkMeta = (LMSDKMetaBuilder()
              ..middlewareVersion(e.sdkMeta?.middlewareVersion ?? "")
              ..sampleAppVersion(e.sdkMeta?.sampleAppVersion ?? "")
              ..uiVersion(e.sdkMeta?.uiVersion ?? ""))
            .build();
        LMLogBuilder lmLogBuilder = LMLogBuilder();
        lmLogBuilder
          ..timestamp(e.timestamp)
          ..severity(getSeverityFromString(e.severity))
          ..sdkMeta(sdkMeta)
          ..stackTrace(stackTrace);

        return lmLogBuilder;
      }).toList();

      return LMResponse(
          success: true,
          data: (GetLogResponseBuilder()..lmLogsBuilder(lmLogBuilderList))
              .build());
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

// this is wrong
  // Deletes the logs passed as parameter
  Future<LMResponse<void>> clearLogs(ClearLogRequest request) async {
    try {
      Iterable<LMLogDB> result =
          loggerBox.valuesBetween(endKey: request.timestamp);

      await loggerBox.deleteAll(result.map((e) => e.timestamp));

      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }
}
