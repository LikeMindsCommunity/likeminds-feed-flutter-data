import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/moderation_service.dart';

class ModerationRepository {
  final ModerationService moderationService;

  ModerationRepository({required this.moderationService});

  Future<GetDeleteReasonResponse> getDeleteReasons(
      GetDeleteReasonRequest request) async {
    final response = await moderationService.getDeleteReasons(request);
    return GetDeleteReasonResponse.fromEntity(response);
  }
}
