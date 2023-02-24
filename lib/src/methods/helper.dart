import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';

class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<TagResponseModel> getTags({int? feedroomId}) async {
    return await helperRepository.getTags(feedroomId: feedroomId);
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }
}
