import 'package:json_annotation/json_annotation.dart';

class LMStackTrace {
  final String error;
  final String stack;

  LMStackTrace._({
    required this.error,
    required this.stack,
  });

  factory LMStackTrace.fromJson(Map<String, dynamic> json) {
    return LMStackTrace._(error: json['error'], stack: json['stack']);
  }

  Map<String, dynamic> toJson() => {'error': error, 'stack': stack};
}

class LMStackTraceBuilder {
  String? _error;
  String? _stack;

  void error(String error) {
    _error = error;
  }

  void stack(String stack) {
    _stack = stack;
  }

  LMStackTrace build() {
    return LMStackTrace._(
      error: _error!,
      stack: _stack!,
    );
  }
}
