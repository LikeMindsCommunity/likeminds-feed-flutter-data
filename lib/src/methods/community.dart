import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/community_repository.dart';

class CommunityApi {
  final CommunityRepository communityRepository;

  CommunityApi({required this.communityRepository});

  Future<GetCommunityConfigurationsResponse>
      getCommunityConfigurations() async {
    return await communityRepository.getCommunityConfigurations();
  }
}
