import 'package:likeminds_feed/likeminds_feed.dart';

class InitiateLoggerRequest {
  final Function(Exception, StackTrace) onErrorHandler;
  final bool shareLogsWithLM;
  final Severity logLevel;
  final String? sampleAppVersion;
  final String? uiVersion;

  InitiateLoggerRequest._({
    required this.onErrorHandler,
    required this.shareLogsWithLM,
    required this.logLevel,
    this.sampleAppVersion,
    this.uiVersion,
  });
}

class InitiateLoggerRequestBuilder {
  Function(Exception, StackTrace)? _onErrorHandler;
  bool? _shareLogsWithLM;
  Severity? _logLevel;
  String? _sampleAppVersion;
  String? _uiVersion;

  void errorHandler(Function(Exception, StackTrace) onErrorHandler) {
    _onErrorHandler = onErrorHandler;
  }

  void shareLogsWithLM(bool shareLogsWithLM) {
    _shareLogsWithLM = shareLogsWithLM;
  }

  void logLevel(Severity logLevel) {
    _logLevel = logLevel;
  }

  void sampleAppVersion(String sampleAppVersion) {
    _sampleAppVersion = sampleAppVersion;
  }

  void uiVersion(String uiVersion) {
    _uiVersion = uiVersion;
  }

  InitiateLoggerRequest build() {
    return InitiateLoggerRequest._(
      onErrorHandler: _onErrorHandler!,
      shareLogsWithLM: _shareLogsWithLM!,
      logLevel: _logLevel!,
      sampleAppVersion: _sampleAppVersion,
      uiVersion: _uiVersion,
    );
  }
}
