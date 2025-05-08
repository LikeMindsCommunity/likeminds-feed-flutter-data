import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/schema/log_db.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';

/// This class handles all the DB operations
/// related to Error Logging
class LogDBHandler {
  final String loggerBoxName;
  late Box<LMLogDB> loggerBox;

  LogDBHandler({required this.loggerBoxName});

  // Initializes the DB
  Future<LMResponse<void>> init() async {
    try {
      final lmLogDBAdapter = LMLogDBAdapter();
      final lmStackTraceDBAdapter = LMStackTraceDBAdapter();
      final lmSDKMetaDBAdapter = LMSDKMetaDBAdapter();

      if (!Hive.isAdapterRegistered(lmLogDBAdapter.typeId)) {
        Hive.registerAdapter(lmLogDBAdapter);
      }
      if (!Hive.isAdapterRegistered(lmStackTraceDBAdapter.typeId)) {
        Hive.registerAdapter(lmStackTraceDBAdapter);
      }
      if (!Hive.isAdapterRegistered(lmSDKMetaDBAdapter.typeId)) {
        Hive.registerAdapter(lmSDKMetaDBAdapter);
      }

      loggerBox = await Hive.openBox<LMLogDB>(loggerBoxName);

      if (loggerBox.isOpen) {
        return LMResponse(success: true);
      } else {
        // This path is less likely as openBox usually throws on failure.
        return LMResponse(
            success: false, errorMessage: 'Failed to open box $loggerBoxName');
      }
    } on Exception catch (e) {
      // It's good practice to also log this critical failure to the console.
      // print('Failed to initialize logger database $loggerBoxName: $e');
      return LMResponse(
          success: false,
          errorMessage:
              'Failed to initialize logger database: ${e.toString()}');
    }
  }

  // Accepts [InsertLogRequest] object as parameter
  // Creates a LMLogDB object and inserts it in the DB
  Future<LMResponse<void>> insertLog(InsertLogRequest request) async {
    try {
      LMStackTraceDB stackTraceRO = LMStackTraceDB(
          exception: request.stackTrace.exception,
          trace: request.stackTrace.stack);

      LMSDKMetaDB sdkMetaRO = LMSDKMetaDB(
        dataLayerVersion: request.sdkMeta?.dataLayerVersion ?? "",
        coreVersion: request.sdkMeta?.coreVersion ?? "",
      );

      // Create the log entry, storing the original timestamp within the object.
      LMLogDB logEntry = LMLogDB(
          timestamp: request.timestamp, // The actual millisecond timestamp
          stackTrace: stackTraceRO,
          sdkMeta: sdkMetaRO,
          severity: request.severity);

      // Use add() to let Hive assign an auto-incrementing integer key.
      // This key is guaranteed to be unique and within the valid 0 - 0xFFFFFFFF range.
      await loggerBox.add(logEntry);

      return LMResponse(success: true);
    } on Exception catch (e) {
      // print('Failed to insert log into Hive box $loggerBoxName: $e');
      return LMResponse(
          success: false,
          errorMessage: 'Failed to insert log: ${e.toString()}');
    }
  }

  // Returns a list of LMLogDB objects
  // which are older than or equal to the timestamp passed as parameter
  LMResponse<GetLogResponse> getLogs(int timestamp) {
    try {
      // Filter values based on the `timestamp` property of the LMLogDB objects.
      // The original code used `valuesBetween(endKey: timestamp)`, meaning logs
      // with key <= timestamp. This replicates that logic for the object's property.
      Iterable<LMLogDB> result =
          loggerBox.values.where((log) => log.timestamp <= timestamp);

      // Converting LMLogDB to LMLog (using builder pattern)
      List<LMLogBuilder> lmLogBuilderList = result.map((e) {
        LMStackTrace stackTrace = (LMStackTraceBuilder()
              ..exception(e.stackTrace?.exception ?? "")
              ..stack(e.stackTrace?.trace ?? ""))
            .build();

        LMSDKMeta sdkMeta = (LMSDKMetaBuilder()
              ..dataLayerVersion(e.sdkMeta?.dataLayerVersion ?? "")
              ..coreVersion(e.sdkMeta?.coreVersion ?? ""))
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
      return LMResponse(
          success: false,
          errorMessage: 'Failed to retrieve logs: ${e.toString()}');
    }
  }

  // Deletes logs older than or equal to the timestamp passed as parameter
  Future<LMResponse<void>> clearLogs(ClearLogRequest request) async {
    try {
      List<dynamic> keysToDelete = [];

      // Iterate over the box's key-value pairs to find logs matching the criterion.
      // loggerBox.toMap() loads all entries into memory. This is generally fine
      // for client-side logging scenarios but could be optimized for extremely large boxes
      // by iterating keys and fetching values one by one if memory becomes an issue.
      loggerBox.toMap().forEach((key, logValue) {
        if (logValue.timestamp <= request.timestamp) {
          keysToDelete.add(key); // `key` is the auto-generated Hive key
        }
      });

      if (keysToDelete.isNotEmpty) {
        await loggerBox.deleteAll(keysToDelete);
      }

      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(
          success: false,
          errorMessage: 'Failed to clear logs: ${e.toString()}');
    }
  }
}
