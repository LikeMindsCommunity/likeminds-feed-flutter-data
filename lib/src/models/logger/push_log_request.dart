import 'package:likeminds_feed/src/models/logger/log.dart';

class PushLogRequest {
  final List<LMLog> logs;

  PushLogRequest._({required this.logs});

  Map<String, dynamic> toJson() {
    return {'logs': logs.map((e) => e.toJson()).toList()};
  }
}

class PushLogRequestBuilder {
  List<LMLog>? _logs = [];

  void logs(List<LMLog> log) {
    _logs = log;
  }

  PushLogRequest build() {
    if (_logs == null) throw Exception("Logs cannot be null");

    return PushLogRequest._(logs: _logs!);
  }
}
