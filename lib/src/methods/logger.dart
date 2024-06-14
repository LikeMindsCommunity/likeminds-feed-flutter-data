import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/logger_repository.dart';

class LoggerApi {
  final LoggerRepository loggerRepository;

  LoggerApi({required this.loggerRepository});

  Future<LMResponse<void>> pushLogs({
    required PushLogRequest request,
  }) async {
    return await loggerRepository.pushLogs(request: request);
  }
}
