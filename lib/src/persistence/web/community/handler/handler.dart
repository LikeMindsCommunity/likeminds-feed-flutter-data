import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/web/community/schema/community_conf_hive.dart';
import 'package:likeminds_feed/src/persistence/web/community/utils/utils.dart';

class LMCommunityConfigurationDBHandler {
  final String communityConfigBoxName;

  LMCommunityConfigurationDBHandler({required this.communityConfigBoxName});

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    try {
      final configBox = await Hive.openBox<LMCommunityConfigurationHive>(
          communityConfigBoxName);
      List<LMCommunityConfigurationHive> communityConfigurationDBModels =
          communityConfigurations
              .map((e) => LMCommunityConfigurationInterfaceWeb
                  .fromCommunityConfiguration(e))
              .toList();

      for (var config in communityConfigurationDBModels) {
        await configBox.put(config.type, config);
      }

      await configBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> deleteCommunityConfiguration(String type) async {
    try {
      final configBox = await Hive.openBox<LMCommunityConfigurationHive>(
          communityConfigBoxName);
      final result = configBox.get(type);

      if (result == null) {
        return LMResponse<void>(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      await configBox.delete(type);
      await configBox.close();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  LMResponse<CommunityConfigurations> getCommunityConfiguration(String type) {
    try {
      final configBox =
          Hive.box<LMCommunityConfigurationHive>(communityConfigBoxName);
      final queryResult = configBox.get(type);

      if (queryResult == null) {
        return LMResponse(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      CommunityConfigurations communityConfiguration =
          LMCommunityConfigurationInterfaceWeb.toCommunityConfiguration(
              queryResult);

      configBox.close();
      return LMResponse(success: true, data: communityConfiguration);
    } on Exception catch (e) {
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> clearCommunityConfigurations() async {
    try {
      final configBox = await Hive.openBox<LMCommunityConfigurationHive>(
          communityConfigBoxName);
      await configBox.clear();
      await configBox.close();
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
