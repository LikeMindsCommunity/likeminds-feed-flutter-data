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
}
