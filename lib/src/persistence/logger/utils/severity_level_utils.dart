import 'package:likeminds_feed/likeminds_feed.dart';

Map<Severity, int> severityLevels = {
  Severity.INFO: 100,
  Severity.DEBUG: 200,
  Severity.NOTICE: 300,
  Severity.WARNING: 400,
  Severity.ERROR: 500,
  Severity.CRITICAL: 600,
  Severity.ALERT: 700,
  Severity.EMERGENCY: 800,
  Severity.DEFAULT: 0,
};

// Returns true if the severity of the error is greater than or equal to the
// the log level set by the LMFeedClient
// [errorSeverity] is the severity of the error
// [logLevel] is the log level set by the LMFeedClient
bool checkSeverityForLoggingErros(
    {required Severity errorSeverity, required Severity logLevel}) {
  return severityLevels[errorSeverity]! >= severityLevels[logLevel]!;
}

Map<Severity, String> severityMap = {
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

Severity getSeverityFromString(String severity) {
  switch (severity) {
    case 'debug':
      return Severity.DEBUG;
    case 'info':
      return Severity.INFO;
    case 'notice':
      return Severity.NOTICE;
    case 'warning':
      return Severity.WARNING;
    case 'error':
      return Severity.ERROR;
    case 'critical':
      return Severity.CRITICAL;
    case 'alert':
      return Severity.ALERT;
    case 'emergency':
      return Severity.EMERGENCY;
    default:
      return Severity.DEFAULT;
  }
}
