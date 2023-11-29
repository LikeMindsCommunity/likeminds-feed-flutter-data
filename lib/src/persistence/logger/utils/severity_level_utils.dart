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
