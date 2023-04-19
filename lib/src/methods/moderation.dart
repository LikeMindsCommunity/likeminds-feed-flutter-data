import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';

class ModerationApi {
  final ModerationRepository moderationRepository;

  ModerationApi({required this.moderationRepository});

  Future<GetDeleteReasonResponse> getDeleteReasons(
      GetDeleteReasonRequest request) async {
    return await moderationRepository.getDeleteReasons(request);
  }
}
