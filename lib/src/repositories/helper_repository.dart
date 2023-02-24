import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/helper_service.dart';

class HelperRepository {
  final HelperService helperService;

  HelperRepository({required this.helperService});

  Future<TagResponseModel> getTags({int? feedroomId}) async {
    final response = await helperService.getTags(feedroomId: feedroomId);
    return TagResponseModel.fromEntity(response);
  }

  void routeProfilePage(String userId) {
    helperService.routeProfilePage(userId);
  }
}
