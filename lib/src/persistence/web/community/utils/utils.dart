import 'dart:convert';

import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/web/community/schema/community_conf_hive.dart';

class LMCommunityConfigurationInterfaceWeb {
  static CommunityConfigurations toCommunityConfiguration(
      LMCommunityConfigurationHive communityConfigurationDBModel) {
    Map<String, dynamic> value =
        jsonDecode(communityConfigurationDBModel.value!)
            as Map<String, dynamic>;

    return CommunityConfigurations(
      description: communityConfigurationDBModel.description,
      type: communityConfigurationDBModel.type,
      value: value,
    );
  }

  static LMCommunityConfigurationHive fromCommunityConfiguration(
      CommunityConfigurations communityConfiguration) {
    return LMCommunityConfigurationHive(
      description: communityConfiguration.description,
      type: communityConfiguration.type,
      value: jsonEncode(communityConfiguration.value),
    );
  }
}
