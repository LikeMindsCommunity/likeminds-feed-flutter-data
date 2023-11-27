import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/logger/device_details.dart';
import 'package:likeminds_feed/src/models/logger/sdk_meta.dart';
import 'package:likeminds_feed/src/models/logger/stacktrace.dart';

part 'log.g.dart';

enum Severity {
  DEBUG,
  INFO,
  NOTICE,
  WARNING,
  ERROR,
  CRITICAL,
  ALERT,
  EMERGENCY,
  DEFAULT
}

@JsonSerializable()
class LMLog {
  int timestamp;
  @JsonKey(name: 'device_details')
  DeviceDetails deviceDetails;
  @JsonKey(name: 'stack_trace')
  LMStackTrace stackTrace;
  @JsonKey(name: 'sdk_meta')
  LMSDKMeta? sdkMeta;
  @JsonKey(name: 'severity')
  Severity? severity;

  LMLog({
    required this.timestamp,
    required this.deviceDetails,
    required this.stackTrace,
    this.sdkMeta,
    this.severity,
  });

  factory LMLog.fromJson(Map<String,dynamic> json) => _$LMLogFromJson(json);

  Map<String,dynamic> toJson() =>_$LMLogToJson(this);
}

class LMLogBuilder {
  int? _timestamp;
  DeviceDetails? _deviceDetails;
  LMStackTrace? _stackTrace;
  LMSDKMeta? _sdkMeta;
  Severity? _severity;

  void timestamp(int timestamp) {
    _timestamp = timestamp;
  }

  void deviceDetails(DeviceDetails deviceDetails) {
    _deviceDetails = deviceDetails;
  }

  void stackTrace(LMStackTrace stackTrace) {
    _stackTrace = stackTrace;
  }

  void sdkMeta(LMSDKMeta sdkMeta) {
    _sdkMeta = sdkMeta;
  }

  void severity(Severity severity) {
    _severity = severity;
  }

  LMLog build() {
    if (_timestamp == null) throw Exception("timestamp cannot be null");
    if (_deviceDetails == null) throw Exception("deviceDetails cannot be null");
    if (_stackTrace == null) throw Exception("stackTrace cannot be null");

    return LMLog(
      timestamp: _timestamp!,
      deviceDetails: _deviceDetails!,
      stackTrace: _stackTrace!,
      sdkMeta: _sdkMeta,
      severity: _severity,
    );
  }
}
