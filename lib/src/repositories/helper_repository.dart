import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/helper_service.dart';

class HelperRepository {
  final HelperService helperService;

  HelperRepository({required this.helperService});

  Future<GetTaggingListResponse> getTaggingList({
    required GetTaggingListRequest request,
  }) async {
    final response = await helperService.getTaggingList(request: request);
    return GetTaggingListResponse.fromEntity(response);
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

  void routeCompanyPage(String companyId) {
    helperService.routeCompanyPage(companyId);
  }
}
