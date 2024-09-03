import 'package:likeminds_feed/src/services/community_service.dart';
import 'package:likeminds_feed/src/models/models.dart';

class CommunityRepository {
  final CommunityService communityService;

  CommunityRepository({required this.communityService});

  Future<GetCommunityConfigurationsResponse>
      getCommunityConfigurations() async {
    final response = await communityService.getCommunityConfigurations();
    return GetCommunityConfigurationsResponse.fromEntity(response);
  }

  Future<LMResponse<ConnectionMetaResponse>> connectionMeta(
      ConnectionMetaRequest request) async {
    final response = await communityService.connectionMeta(request);
    return LMResponse.fromData(
      response: response,
      data: response.data != null
          ? ConnectionMetaResponse.fromEntity(response.data!)
          : null,
    );
  }

  Future<LMResponse<void>> sendConnection(SendConnectionRequest request) async {
    final response = await communityService.sendConnection(request);
    return response;
  }

  Future<LMResponse<void>> updateConnection(
      UpdateConnectionRequest request) async {
    final response = await communityService.updateConnection(request);
    return response;
  }
}
