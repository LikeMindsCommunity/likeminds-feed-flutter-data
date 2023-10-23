import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';

class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<GetTaggingListResponse> getTaggingList({
    required GetTaggingListRequest request,
  }) async {
    return await helperRepository.getTaggingList(request: request);
  }

  Future<DecodeUrlResponse> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    return await helperRepository.decodeUrl(request: request);
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }

  void routeCompanyPage(String companyId) {
    helperRepository.routeCompanyPage(companyId);
  }
}
