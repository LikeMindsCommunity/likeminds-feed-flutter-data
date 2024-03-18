import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/cache/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_db.dart';
import 'package:likeminds_feed/src/persistence/community/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/community/schema/community_conf_db.dart';
import 'package:likeminds_feed/src/persistence/user/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/user/schema/user_db.dart';
import 'package:realm/realm.dart' as realm;

class PersistenceService {
  LMCacheDBHandler? cacheDBHandler;
  LMUserDBHandler? userDBHandler;
  LMCommunityConfigurationDBHandler? communityConfigurationDBHandler;

  PersistenceService() {
    cacheDBHandler = LMCacheDBHandler(
        config: realm.Configuration.local([
      CacheRO.schema,
    ]));

    userDBHandler = LMUserDBHandler(
        config: realm.Configuration.local([
      LMUserRO.schema,
      LMSDKClientInfoRO.schema,
      LMMemberRightRO.schema,
      LMMemberStateRO.schema,
    ]));

    communityConfigurationDBHandler = LMCommunityConfigurationDBHandler(
        config: realm.Configuration.local([
      LMCommunityConfigurationRO.schema,
    ]));
  }

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return await userDBHandler!.insertOrUpdateUser(user);
  }

  LMResponse<User> getUserDB() {
    return userDBHandler!.getUser();
  }

  Future<LMResponse<void>> deleteUserDB() async {
    return await userDBHandler!.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    return await cacheDBHandler!.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return await cacheDBHandler!.deleteValueFromCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return cacheDBHandler!.getValueFromCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return await cacheDBHandler!.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    return await communityConfigurationDBHandler!
        .insertOrUpdateCommunityConfiguration(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return communityConfigurationDBHandler!.getCommunityConfiguration(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) async {
    return await communityConfigurationDBHandler!
        .deleteCommunityConfiguration(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationsDB() async {
    return await communityConfigurationDBHandler!
        .clearCommunityConfigurations();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await userDBHandler!.insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandler!.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await userDBHandler!.deleteMemberState();
  }
}
