import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/helper_service.dart';

class HelperRepository {
  final HelperService helperService;

  HelperRepository({required this.helperService});

  Future<TagResponseModel> getTags({
    required TagRequestModel request,
  }) async {
    final response = await helperService.getTags(request: request);
    return TagResponseModel.fromEntity(response);
  }

  Future<DecodeUrlResponse> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    final response = await helperService.decodeUrl(request: request);
    return DecodeUrlResponse.fromEntity(response);
  }

  void routeProfilePage(String userId) {
    helperService.routeProfilePage(userId);
  }
}
