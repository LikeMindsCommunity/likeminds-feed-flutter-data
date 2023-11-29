import 'package:likeminds_feed/src/models/logger/push_log_request.dart';
import 'package:likeminds_feed/src/models/logger/push_log_response.dart';
import 'package:likeminds_feed/src/services/logger_service.dart';

class LoggerRepository {
  final LoggerService loggerService;

  LoggerRepository({required this.loggerService});

  Future<PushLogResponse> pushLogs({required PushLogRequest request}) async {
    PushLogResponseEntity pushLogResponseEntity =
        await loggerService.pushLogs(request: request);

    return PushLogResponse.fromEntity(pushLogResponseEntity);
  }
}
