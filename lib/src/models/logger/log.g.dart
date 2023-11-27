// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LMLog _$LMLogFromJson(Map<String, dynamic> json) => LMLog(
      timestamp: json['timestamp'] as int,
      deviceDetails: DeviceDetails.fromJson(
          json['device_details'] as Map<String, dynamic>),
      stackTrace:
          LMStackTrace.fromJson(json['stack_trace'] as Map<String, dynamic>),
      sdkMeta: json['sdk_meta'] == null
          ? null
          : LMSDKMeta.fromJson(json['sdk_meta'] as Map<String, dynamic>),
      severity: $enumDecodeNullable(_$SeverityEnumMap, json['severity']),
    );

Map<String, dynamic> _$LMLogToJson(LMLog instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'device_details': instance.deviceDetails.toJson(),
      'stack_trace': instance.stackTrace.toJson(),
      'sdk_meta': instance.sdkMeta?.toJson(),
      'severity': _$SeverityEnumMap[instance.severity],
    };

const _$SeverityEnumMap = {
  Severity.DEBUG: 'DEBUG',
  Severity.INFO: 'INFO',
  Severity.NOTICE: 'NOTICE',
  Severity.WARNING: 'WARNING',
  Severity.ERROR: 'ERROR',
  Severity.CRITICAL: 'CRITICAL',
  Severity.ALERT: 'ALERT',
  Severity.EMERGENCY: 'EMERGENCY',
  Severity.DEFAULT: 'DEFAULT',
};
