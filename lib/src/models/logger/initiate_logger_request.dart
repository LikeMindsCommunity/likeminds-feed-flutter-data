import 'package:likeminds_feed/likeminds_feed.dart';

/// A request model for initiating the logger configuration.
///
/// This class is used to configure the logger with specific settings
/// such as error handling, log sharing preferences, log severity level,
/// and an optional core version.
///
/// Properties:
/// - [onErrorHandler]: A callback function that handles errors by providing
///   an [Exception] and its associated [StackTrace].
/// - [shareLogsWithLM]: A boolean flag indicating whether logs should be
///   shared with LikeMinds.
/// - [logLevel]: The severity level of logs to be captured.
/// - [coreVersion]: An optional string representing the core version of SDK.

class InitiateLoggerRequest {
  final Function(Exception, StackTrace) onErrorHandler;
  final bool shareLogsWithLM;
  final Severity logLevel;
  final String? coreVersion;

  InitiateLoggerRequest._({
    required this.onErrorHandler,
    required this.shareLogsWithLM,
    required this.logLevel,
    this.coreVersion,
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
    if (_onErrorHandler == null) {
      throw ArgumentError('onErrorHandler must not be null');
    }
    if (_shareLogsWithLM == null) {
      throw ArgumentError('shareLogsWithLM must not be null');
    }
    if (_logLevel == null) {
      throw ArgumentError('logLevel must not be null');
    }

    return InitiateLoggerRequest._(
      onErrorHandler: _onErrorHandler!,
      shareLogsWithLM: _shareLogsWithLM!,
      logLevel: _logLevel!,
      coreVersion: _coreVersion!,
    );
  }
}

extension InitiateLoggerRequestCopyWith on InitiateLoggerRequest {
  InitiateLoggerRequest copyWith({
    Function(Exception, StackTrace)? onErrorHandler,
    bool? shareLogsWithLM,
    Severity? logLevel,
    String? coreVersion,
  }) {
    return InitiateLoggerRequest._(
      onErrorHandler: onErrorHandler ?? this.onErrorHandler,
      shareLogsWithLM: shareLogsWithLM ?? this.shareLogsWithLM,
      logLevel: logLevel ?? this.logLevel,
      coreVersion: coreVersion ?? this.coreVersion,
    );
  }
}
