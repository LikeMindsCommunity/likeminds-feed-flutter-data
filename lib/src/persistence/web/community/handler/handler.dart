import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/web/community/schema/community_conf_hive.dart';
import 'package:likeminds_feed/src/persistence/web/community/utils/utils.dart';

class LMCommunityConfigurationDBHandlerHive {
  final String communityConfigBoxName;
  late Box<LMCommunityConfigurationHive> communityConfigBox;

  LMCommunityConfigurationDBHandlerHive({required this.communityConfigBoxName});

  Future<LMResponse<void>> init() async {
    try {
      communityConfigBox = await Hive.openBox<LMCommunityConfigurationHive>(
          communityConfigBoxName);

      if (communityConfigBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: "Failed to open box");
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    try {
      List<LMCommunityConfigurationHive> communityConfigurationDBModels =
          communityConfigurations
              .map((e) => LMCommunityConfigurationInterfaceWeb
                  .fromCommunityConfiguration(e))
              .toList();

      for (var config in communityConfigurationDBModels) {
        await communityConfigBox.put(config.type, config);
      }

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
      final result = communityConfigBox.get(type);

      if (result == null) {
        return LMResponse<void>(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }
      await communityConfigBox.delete(type);
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
      final queryResult = communityConfigBox.get(type);

      if (queryResult == null) {
        return LMResponse(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      CommunityConfigurations communityConfiguration =
          LMCommunityConfigurationInterfaceWeb.toCommunityConfiguration(
              queryResult);

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
      await communityConfigBox.clear();
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
