import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/community/schema/community_conf_db.dart';
import 'package:likeminds_feed/src/persistence/community/utils/utils.dart';
import 'package:realm/realm.dart';

class LMCommunityConfigurationDBHandler {
  Configuration config;

  LMCommunityConfigurationDBHandler({required this.config});

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    Realm realm = Realm(config);
    try {
      List<LMCommunityConfigurationRO> communityConfigurationDBModel =
          communityConfigurations
              .map((e) =>
                  LMCommunityConfigurationInterface.fromCommunityConfiguration(
                      e))
              .toList();

      await realm.writeAsync(() {
        realm.addAll(communityConfigurationDBModel, update: true);
      });

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> deleteCommunityConfiguration(String type) async {
    Realm realm = Realm(config);
    try {
      LMCommunityConfigurationRO? result =
          realm.find<LMCommunityConfigurationRO>(type);

      if (result == null) {
        return LMResponse<void>(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      await realm.writeAsync(() {
        realm.delete(result);
      });

      realm.close();

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  LMResponse<CommunityConfigurations> getCommunityConfiguration(String type) {
    Realm realm = Realm(config);
    try {
      LMCommunityConfigurationRO? queryResult =
          realm.find<LMCommunityConfigurationRO>(type);

      if (queryResult == null) {
        return LMResponse(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      CommunityConfigurations communityConfiguration =
          LMCommunityConfigurationInterface.toCommunityConfiguration(
              queryResult);

      realm.close();

      return LMResponse(success: true, data: communityConfiguration);
    } on Exception catch (e) {
      realm.close();
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> clearCommunityConfigurations() async {
    Realm realm = Realm(config);
    try {
      RealmResults<LMCommunityConfigurationRO> results =
          realm.all<LMCommunityConfigurationRO>();

      await realm.writeAsync(() {
        realm.deleteMany(results);
      });

      realm.close();

      return LMResponse(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
