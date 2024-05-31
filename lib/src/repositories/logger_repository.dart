import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/logger_service.dart';

class LoggerRepository {
  final LoggerService loggerService;

  LoggerRepository({required this.loggerService});

  Future<LMResponse<void>> pushLogs({required PushLogRequest request}) async {
    LMResponse pushLogResponseEntity =
        await loggerService.pushLogs(request: request);

    return pushLogResponseEntity;
  }
}
