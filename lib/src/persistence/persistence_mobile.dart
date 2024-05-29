import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/cache/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_db.dart';
import 'package:likeminds_feed/src/persistence/community/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/community/schema/community_conf_db.dart';
import 'package:likeminds_feed/src/persistence/logger/logger.dart';
import 'package:likeminds_feed/src/persistence/user/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/user/schema/user_db.dart';
import 'package:realm/realm.dart' as realm;

LMFeedPersistence getPersistenceService() => LMFeedPersistenceMobile();

class LMFeedPersistenceMobile implements LMFeedPersistence {
  LMCacheDBHandler? cacheDBHandler;
  LMUserDBHandler? userDBHandler;
  LMCommunityConfigurationDBHandler? communityConfigurationDBHandler;

  LMFeedPersistenceMobile() {
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

  @override
  Future<LMResponse<void>> init() async {
    return LMResponse(success: true);
  }

  @override
  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return await userDBHandler!.insertOrUpdateUser(user);
  }

  @override
  LMResponse<User> getUserDB() {
    return userDBHandler!.getUser();
  }

  @override
  Future<LMResponse<void>> deleteUserDB() async {
    return await userDBHandler!.deleteUser();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    return await cacheDBHandler!.insertOrUpdateValueInCache(cache);
  }

  @override
  Future<LMResponse<void>> deleteCache(String key) async {
    return await cacheDBHandler!.deleteValueFromCache(key);
  }

  @override
  LMResponse<LMCache> getCache(String key) {
    return cacheDBHandler!.getValueFromCache(key);
  }

  @override
  Future<LMResponse<void>> clearCache() async {
    return await cacheDBHandler!.clearCache();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    return await communityConfigurationDBHandler!
        .insertOrUpdateCommunityConfiguration(communityConfigurations);
  }

  @override
  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return communityConfigurationDBHandler!.getCommunityConfiguration(type);
  }

  @override
  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) async {
    return await communityConfigurationDBHandler!
        .deleteCommunityConfiguration(type);
  }

  @override
  Future<LMResponse<void>> clearCommunityConfigurationsDB() async {
    return await communityConfigurationDBHandler!
        .clearCommunityConfigurations();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await userDBHandler!.insertOrUpdateMemberState(memberStateResponse);
  }

  @override
  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandler!.getMemberState();
  }

  @override
  Future<LMResponse<void>> deleteMemberState() async {
    return await userDBHandler!.deleteMemberState();
  }

  @override
  bool checkIfLoggerInitialised() {
    return LMFeedLogger.instance.checkIfLoggerInitialised();
  }

  @override
  void initialiseLogger(
      {required InitiateLoggerRequest initiateLoggerRequest}) {
    return LMFeedLogger.instance
        .initialise(initiateLoggerRequest: initiateLoggerRequest);
  }

  @override
  void handleException(Exception exception, StackTrace stackTrace,
      {Severity errorSeverity = Severity.ERROR}) {
    LMFeedPersistence.instance.handleException(exception, stackTrace);
  }

  @override
  Future<void> flushLogs() async {
    await LMFeedLogger.instance.flushLogs();
  }
}
