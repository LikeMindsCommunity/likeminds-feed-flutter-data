import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/schema/log_db.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';
import 'package:realm/realm.dart';

// This class handles all the DB operations
// related to Error Logging
// Accepts a [realm] instance as parameter
class LogDBHandler {
  Realm? realm;
  Configuration config;

  LogDBHandler({required this.config});

  // checks if realm is closed
  // if closed, then opens a new realm instance
  void checkIfRealmClosed() {
    if (realm == null || realm!.isClosed) {
      openLoggerRealm();
    }
  }

  // Opens a realm instance with all the neccessary schemas
  void openLoggerRealm() {
    realm = Realm(config);
  }

  // Closes the realm instance
  void closeLoggerRealm() {
    realm?.close();
  }

  // Accepts [InsertLogRequest] object as parameter
  // Creates a LogDBModel object and inserts it in the DB
  void insertLog(InsertLogRequest request) {
    checkIfRealmClosed();
    StackTraceDBModel stackTraceRO = StackTraceDBModel(
        request.stackTrace.exception, request.stackTrace.stack);
    SDKMetaDBModel sdkMetaRO = SDKMetaDBModel(
        sampleAppVersion: request.sdkMeta?.sampleAppVersion ?? '',
        uiVersion: request.sdkMeta?.uiVersion ?? '',
        middlewareVersion: request.sdkMeta?.middlewareVersion ?? '');
    realm!.write(() {
      realm!.add(LogDBModel(
        request.timestamp,
        request.severity,
        stackTrace: stackTraceRO,
        sdkMeta: sdkMetaRO,
      ));
    });
    closeLoggerRealm();
  }

  // Returns a list of LogDBModel objects
  // which are older than the timestamp passed as parameter
  GetLogResponse getLogs(int timestamp) {
    checkIfRealmClosed();
    //RealmResults<LogDBModel> realmResults = realm!.all<LogDBModel>();
    RealmResults<LogDBModel> queryResults =
        realm!.query<LogDBModel>('timestamp <= $timestamp');

    // Converting LogDBModel to LMLog while
    // Mapping LMLog list with Device Details
    List<LMLogBuilder> lmLogBuilderList = queryResults.map((e) {
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
    closeLoggerRealm();

    return (GetLogResponseBuilder()..lmLogsBuilder(lmLogBuilderList)).build();
  }

  // Deletes the logs passed as parameter
  void clearLogs(ClearLogRequest request) async {
    checkIfRealmClosed();
    RealmResults<LogDBModel> queryResults =
        realm!.query<LogDBModel>('timestamp <= ${request.timestamp}');

    realm!.write(() {
      realm!.deleteMany(queryResults);
    });
    closeLoggerRealm();
  }
}
