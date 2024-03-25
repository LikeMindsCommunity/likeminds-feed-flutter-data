import 'dart:convert';

import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/community/schema/community_conf_db.dart';

class LMCommunityConfigurationInterface {
  static toCommunityConfiguration(
      LMCommunityConfigurationRO communityConfigurationDBModel) {
    Map<String, dynamic> value =
        jsonDecode(communityConfigurationDBModel.value!)
            as Map<String, dynamic>;

    return CommunityConfigurations(
      description: communityConfigurationDBModel.description,
      type: communityConfigurationDBModel.type,
      value: value,
    );
  }

  static LMCommunityConfigurationRO fromCommunityConfiguration(
      CommunityConfigurations communityConfiguration) {
    return LMCommunityConfigurationRO(
      communityConfiguration.type,
      description: communityConfiguration.description,
      value: jsonEncode(communityConfiguration.value),
    );
  }
}
