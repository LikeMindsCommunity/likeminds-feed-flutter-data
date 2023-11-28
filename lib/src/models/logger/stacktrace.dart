class LMStackTrace {
  final String exception;
  final String stack;

  LMStackTrace._({
    required this.exception,
    required this.stack,
  });

  factory LMStackTrace.fromJson(Map<String, dynamic> json) {
    return LMStackTrace._(exception: json['exception'], stack: json['stack']);
  }

  Map<String, dynamic> toJson() => {'exception': exception, 'stack': stack};
}

class LMStackTraceBuilder {
  String? _exception;
  String? _stack;

  void exception(String exception) {
    _exception = exception;
  }

  void stack(String stack) {
    _stack = stack;
  }

  LMStackTrace build() {
    return LMStackTrace._(
      exception: _exception!,
      stack: _stack!,
    );
  }
}
