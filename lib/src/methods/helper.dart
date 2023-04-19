import 'package:likeminds_feed/src/models/helper/tag_request_model.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';

class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<TagResponseModel> getTags({
    required TagRequestModel request,
  }) async {
    return await helperRepository.getTags(request: request);
  }

  Future<DecodeUrlResponse> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    return await helperRepository.decodeUrl(request: request);
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }
}
