import 'package:realm/realm.dart';

part 'log_db.g.dart';

@RealmModel()
class _LMLogDBModel {
  @PrimaryKey()
  late final int timestamp;
  @MapTo('stack_trace')
  late final _LMStackTraceDBModel? stackTrace;
  @MapTo('sdk_meta')
  late final _LMSDKMetaDBModel? sdkMeta;

  late final String severity;

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'stack_trace': stackTrace?.toJson(),
      'sdk_meta': sdkMeta?.toJson(),
      'severity': severity
    };
  }
}

@RealmModel()
class _LMSDKMetaDBModel {
  @MapTo('sample_app_version')
  late final String? sampleAppVersion;
  @MapTo('ui_version')
  late final String? uiVersion;
  @MapTo('middleware_version')
  late final String? middlewareVersion;

  Map<String, dynamic> toJson() {
    return {
      'sample_app_version': sampleAppVersion,
      'ui_version': uiVersion,
      'middleware_version': middlewareVersion
    };
  }
}

@RealmModel()
class _LMStackTraceDBModel {
  late final String exception;
  late final String trace;

  Map<String, dynamic> toJson() {
    return {'exception': exception, 'trace': trace};
  }
}
