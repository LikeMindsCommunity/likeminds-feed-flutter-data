import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/community_repository.dart';

class CommunityApi {
  final CommunityRepository communityRepository;

  CommunityApi({required this.communityRepository});

  Future<GetCommunityConfigurationsResponse>
      getCommunityConfigurations() async {
    return await communityRepository.getCommunityConfigurations();
  }

  Future<LMResponse<ConnectionMetaResponse>> connectionMeta(
      ConnectionMetaRequest request) async {
    return await communityRepository.connectionMeta(request);
  }

  Future<LMResponse<void>> sendConnection(SendConnectionRequest request) async {
    return await communityRepository.sendConnection(request);
  }

  Future<LMResponse<void>> updateConnection(
      UpdateConnectionRequest request) async {
    return await communityRepository.updateConnection(request);
  }
}
