import 'package:likeminds_feed/likeminds_feed.dart';

class InitiateLoggerRequest {
  final Function(Exception, StackTrace) onErrorHandler;
  final bool shareLogsWithLM;
  final Severity logLevel;
  final String coreVersion;

  InitiateLoggerRequest._({
    required this.onErrorHandler,
    required this.shareLogsWithLM,
    required this.logLevel,
    required this.coreVersion,
  });
}

class InitiateLoggerRequestBuilder {
  Function(Exception, StackTrace)? _onErrorHandler;
  bool? _shareLogsWithLM;
  Severity? _logLevel;
  String? _coreVersion;

  void errorHandler(Function(Exception, StackTrace) onErrorHandler) {
    _onErrorHandler = onErrorHandler;
  }

  void shareLogsWithLM(bool shareLogsWithLM) {
    _shareLogsWithLM = shareLogsWithLM;
  }

  void logLevel(Severity logLevel) {
    _logLevel = logLevel;
  }

  void coreVersion(String coreVersion) {
    _coreVersion = coreVersion;
  }

  InitiateLoggerRequest build() {
    return InitiateLoggerRequest._(
      onErrorHandler: _onErrorHandler!,
      shareLogsWithLM: _shareLogsWithLM!,
      logLevel: _logLevel!,
      coreVersion: _coreVersion!,
    );
  }
}
