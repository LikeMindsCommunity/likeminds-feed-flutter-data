import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';

class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<TagResponseModel> getTags({
    int? feedroomId,
    int? page,
    int? pageSize,
    String? searchQuery,
  }) async {
    return await helperRepository.getTags(
      feedroomId: feedroomId,
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
    );
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }
}
