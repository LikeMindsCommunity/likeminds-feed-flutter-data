import 'dart:convert';

import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/community/schema/community_conf_hive.dart';

class LMCommunityConfigurationDBInterface {
  static CommunityConfigurations toCommunityConfiguration(
      LMCommunityConfigurationDB communityConfigurationDBModel) {
    Map<String, dynamic> value =
        jsonDecode(communityConfigurationDBModel.value!)
            as Map<String, dynamic>;

    return CommunityConfigurations(
      description: communityConfigurationDBModel.description,
      type: communityConfigurationDBModel.type,
      value: value,
    );
  }

  static LMCommunityConfigurationDB fromCommunityConfiguration(
      CommunityConfigurations communityConfiguration) {
    return LMCommunityConfigurationDB(
      description: communityConfiguration.description,
      type: communityConfiguration.type,
      value: jsonEncode(communityConfiguration.value),
    );
  }
}
