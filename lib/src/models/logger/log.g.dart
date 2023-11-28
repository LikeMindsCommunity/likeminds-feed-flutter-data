// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LMLog _$LMLogFromJson(Map<String, dynamic> json) => LMLog(
      timestamp: json['timestamp'] as int,
      deviceMeta:
          DeviceDetails.fromJson(json['device_meta'] as Map<String, dynamic>),
      stackTrace:
          LMStackTrace.fromJson(json['stack_trace'] as Map<String, dynamic>),
      sdkMeta: json['sdk_meta'] == null
          ? null
          : LMSDKMeta.fromJson(json['sdk_meta'] as Map<String, dynamic>),
      severity: $enumDecodeNullable(_$SeverityEnumMap, json['severity']),
    );

Map<String, dynamic> _$LMLogToJson(LMLog instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'device_meta': instance.deviceMeta.toJson(),
      'stack_trace': instance.stackTrace.toJson(),
      'sdk_meta': instance.sdkMeta?.toJson(),
      'severity': _$SeverityEnumMap[instance.severity],
    };

const _$SeverityEnumMap = {
  Severity.DEBUG: 'debug',
  Severity.INFO: 'info',
  Severity.NOTICE: 'notice',
  Severity.WARNING: 'warning',
  Severity.ERROR: 'error',
  Severity.CRITICAL: 'critical',
  Severity.ALERT: 'alert',
  Severity.EMERGENCY: 'emergency',
  Severity.DEFAULT: 'default',
};
