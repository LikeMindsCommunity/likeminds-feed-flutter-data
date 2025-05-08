import 'package:hive/hive.dart';

part 'log_db.g.dart';

@HiveType(typeId: 40)
class LMLogDB extends HiveObject {
  @HiveField(0)
  int timestamp;

  @HiveField(1)
  LMStackTraceDB? stackTrace;
  @HiveField(2)
  LMSDKMetaDB? sdkMeta;
  @HiveField(3)
  String severity;

  LMLogDB({
    required this.timestamp,
    required this.stackTrace,
    required this.sdkMeta,
    required this.severity,
  });

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'stack_trace': stackTrace?.toJson(),
      'sdk_meta': sdkMeta?.toJson(),
      'severity': severity
    };
  }
}

// TODO: change this noor
@HiveType(typeId: 41)
class LMSDKMetaDB extends HiveObject {
  @HiveField(0)
  String? dataLayerVersion;
  @HiveField(1)
  String? coreVersion;

  LMSDKMetaDB({this.dataLayerVersion, this.coreVersion});

  Map<String, dynamic> toJson() {
    return {
      'data_layer_version': dataLayerVersion,
      'core_version': coreVersion,
    };
  }
}

@HiveType(typeId: 42)
class LMStackTraceDB extends HiveObject {
  @HiveField(0)
  String exception;
  @HiveField(1)
  String trace;

  LMStackTraceDB({required this.exception, required this.trace});

  Map<String, dynamic> toJson() {
    return {'exception': exception, 'trace': trace};
  }
}
