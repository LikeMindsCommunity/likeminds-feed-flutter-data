import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/web/cache/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/web/community/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/web/user/handler/handler.dart';

LMFeedPersistence getPersistenceService() => LMFeedPersistenceWeb();

class LMFeedPersistenceWeb implements LMFeedPersistence {
  late LMUserDBHandlerHive userDBHandlerHive;
  late LMCommunityConfigurationDBHandlerHive
      communityConfigurationDBHandlerHive;
  late LMCacheDBHandlerHive cacheDBHandlerHive;

  LMFeedPersistenceWeb() {
    userDBHandlerHive = LMUserDBHandlerHive(
      userBoxName: 'userBox',
      memberStateBoxName: 'memberStateBox',
    );
    communityConfigurationDBHandlerHive = LMCommunityConfigurationDBHandlerHive(
      communityConfigBoxName: 'communityConfigurationBox',
    );
    cacheDBHandlerHive = LMCacheDBHandlerHive(
      cacheBoxName: 'cacheBox',
    );
  }

  @override
  Future<LMResponse<void>> init() async {
    LMResponse userDBInit = await userDBHandlerHive.init();
    LMResponse communityCongDB =
        await communityConfigurationDBHandlerHive.init();
    LMResponse cacheDBHandler = await cacheDBHandlerHive.init();

    if (!userDBInit.success) {
      return LMResponse(success: false, errorMessage: userDBInit.errorMessage);
    } else if (!communityCongDB.success) {
      return LMResponse(
          success: false, errorMessage: communityCongDB.errorMessage);
    } else if (!cacheDBHandler.success) {
      return LMResponse(
          success: false, errorMessage: cacheDBHandler.errorMessage);
    } else {
      return LMResponse(success: true);
    }
  }

  @override
  Future<LMResponse<void>> insertOrUpdateUser(User user) {
    return userDBHandlerHive.insertOrUpdateUser(user);
  }

  @override
  LMResponse<User> getUserDB() {
    return userDBHandlerHive.getUser();
  }

  @override
  Future<LMResponse<void>> deleteUserDB() {
    return userDBHandlerHive.deleteUser();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) {
    return cacheDBHandlerHive.insertOrUpdateValueInCache(cache);
  }

  @override
  Future<LMResponse<void>> deleteCache(String key) {
    return cacheDBHandlerHive.deleteValueFromCache(key);
  }

  @override
  LMResponse<LMCache> getCache(String key) {
    return cacheDBHandlerHive.getValueFromCache(key);
  }

  @override
  Future<LMResponse<void>> clearCache() {
    return cacheDBHandlerHive.clearCache();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) {
    return communityConfigurationDBHandlerHive
        .insertOrUpdateCommunityConfiguration(communityConfigurations);
  }

  @override
  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return communityConfigurationDBHandlerHive.getCommunityConfiguration(type);
  }

  @override
  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) {
    return communityConfigurationDBHandlerHive
        .deleteCommunityConfiguration(type);
  }

  @override
  Future<LMResponse<void>> clearCommunityConfigurationsDB() {
    return communityConfigurationDBHandlerHive.clearCommunityConfigurations();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) {
    return userDBHandlerHive.insertOrUpdateMemberState(memberStateResponse);
  }

  @override
  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandlerHive.getMemberState();
  }

  @override
  Future<LMResponse<void>> deleteMemberState() {
    return userDBHandlerHive.deleteMemberState();
  }

  @override
  bool checkIfLoggerInitialised() {
    throw UnimplementedError();
  }

  @override
  void initialiseLogger(
      {required InitiateLoggerRequest initiateLoggerRequest}) {
    throw UnimplementedError();
  }

  @override
  void handleException(Exception exception, StackTrace stackTrace,
      {Severity errorSeverity = Severity.ERROR}) {
    throw UnimplementedError();
  }

  @override
  Future<void> flushLogs() {
    throw UnimplementedError();
  }
}
