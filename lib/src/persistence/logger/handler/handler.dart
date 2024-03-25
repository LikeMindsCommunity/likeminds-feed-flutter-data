import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/logger/schema/log_db.dart';
import 'package:likeminds_feed/src/persistence/logger/utils/severity_level_utils.dart';
import 'package:realm/realm.dart';

// This class handles all the DB operations
// related to Error Logging
// Accepts a [realm] instance as parameter
class LogDBHandler {
  Configuration config;

  LogDBHandler({required this.config});

  // Accepts [InsertLogRequest] object as parameter
  // Creates a LMLogDBModel object and inserts it in the DB
  void insertLog(InsertLogRequest request) {
    Realm realm = Realm(config);
    LMStackTraceDBModel stackTraceRO = LMStackTraceDBModel(
        request.stackTrace.exception, request.stackTrace.stack);
    LMSDKMetaDBModel sdkMetaRO = LMSDKMetaDBModel(
        sampleAppVersion: request.sdkMeta?.sampleAppVersion ?? '',
        uiVersion: request.sdkMeta?.uiVersion ?? '',
        middlewareVersion: request.sdkMeta?.middlewareVersion ?? '');
    realm.write(() {
      realm.add(LMLogDBModel(
        request.timestamp,
        request.severity,
        stackTrace: stackTraceRO,
        sdkMeta: sdkMetaRO,
      ));
    });
    realm.close();
  }

  // Returns a list of LMLogDBModel objects
  // which are older than the timestamp passed as parameter
  GetLogResponse getLogs(int timestamp) {
    Realm realm = Realm(config);
    //RealmResults<LMLogDBModel> realmResults = realm!.all<LMLogDBModel>();
    RealmResults<LMLogDBModel> queryResults =
        realm.query<LMLogDBModel>('timestamp <= $timestamp');

    // Converting LMLogDBModel to LMLog while
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
    realm.close();

    return (GetLogResponseBuilder()..lmLogsBuilder(lmLogBuilderList)).build();
  }

  // Deletes the logs passed as parameter
  void clearLogs(ClearLogRequest request) async {
    Realm realm = Realm(config);
    RealmResults<LMLogDBModel> queryResults =
        realm.query<LMLogDBModel>('timestamp <= ${request.timestamp}');

    realm.write(() {
      realm.deleteMany(queryResults);
    });

    realm.close();
  }
}
