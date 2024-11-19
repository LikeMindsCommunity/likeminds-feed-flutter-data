import 'package:hive_flutter/hive_flutter.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/cache/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/community/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/logger/logger.dart';
import 'package:likeminds_feed/src/persistence/seen_post/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/temp_post/handler/handler.dart';
import 'package:likeminds_feed/src/persistence/user/handler/handler.dart';

class LMFeedPersistence {
  late LMUserDBHandlerHive userDBHandlerHive;
  late LMCommunityConfigurationDBHandler communityConfigurationDBHandlerHive;
  late LMCacheDBHandler cacheDBHandlerHive;
  late LMFeedLogger logger;
  late LMFeedSeenPostDBHandler seenPostDBHandler;
  late LMFeedTempPostDBHandler tempPostDBHandler;

  static LMFeedPersistence? _instance;

  static LMFeedPersistence get instance => _instance ??= LMFeedPersistence._();

  LMFeedPersistence._() {
    userDBHandlerHive = LMUserDBHandlerHive(
      userBoxName: 'userBox',
      memberStateBoxName: 'memberStateBox',
    );
    communityConfigurationDBHandlerHive = LMCommunityConfigurationDBHandler(
      communityConfigBoxName: 'communityConfigurationBox',
    );
    cacheDBHandlerHive = LMCacheDBHandler(
      cacheBoxName: 'cacheBox',
    );
    logger = LMFeedLogger.instance;

    seenPostDBHandler = LMFeedSeenPostDBHandler(
      seenPostBoxName: 'seenPostBox',
    );
    tempPostDBHandler = LMFeedTempPostDBHandler(
      postBoxName: 'tempPostBox',
    );
  }

  Future<LMResponse<void>> init({InitiateLoggerRequest? request}) async {
    await Hive.initFlutter();

    LMResponse userDBInit = await userDBHandlerHive.init();
    LMResponse communityCongDB =
        await communityConfigurationDBHandlerHive.init();
    LMResponse cacheDBHandler = await cacheDBHandlerHive.init();
    LMResponse seenPostDBInit = await seenPostDBHandler.init();
    LMResponse tempPostDBInit = await tempPostDBHandler.init();
    LMResponse? loggerInitResponse;
    if (request != null) {
      loggerInitResponse =
          await initialiseLogger(initiateLoggerRequest: request);
    }

    if (!userDBInit.success) {
      return LMResponse(success: false, errorMessage: userDBInit.errorMessage);
    } else if (!communityCongDB.success) {
      return LMResponse(
          success: false, errorMessage: communityCongDB.errorMessage);
    } else if (!cacheDBHandler.success) {
      return LMResponse(
          success: false, errorMessage: cacheDBHandler.errorMessage);
    } else if (loggerInitResponse != null && !loggerInitResponse.success) {
      return LMResponse(
          success: false, errorMessage: loggerInitResponse.errorMessage);
    } else if (!seenPostDBInit.success) {
      return seenPostDBInit;
    } else if (!tempPostDBInit.success) {
      return tempPostDBInit;
    } else {
      return LMResponse(success: true);
    }
  }

  Future<LMResponse<void>> insertOrUpdateUser(User user) {
    return userDBHandlerHive.insertOrUpdateUser(user);
  }

  LMResponse<User> getUserDB() {
    return userDBHandlerHive.getUser();
  }

  Future<LMResponse<void>> deleteUserDB() {
    return userDBHandlerHive.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) {
    return cacheDBHandlerHive.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) {
    return cacheDBHandlerHive.deleteValueFromCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return cacheDBHandlerHive.getValueFromCache(key);
  }

  Future<LMResponse<void>> clearCache() {
    return cacheDBHandlerHive.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) {
    return communityConfigurationDBHandlerHive
        .insertOrUpdateCommunityConfiguration(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return communityConfigurationDBHandlerHive.getCommunityConfiguration(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) {
    return communityConfigurationDBHandlerHive
        .deleteCommunityConfiguration(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationsDB() {
    return communityConfigurationDBHandlerHive.clearCommunityConfigurations();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) {
    return userDBHandlerHive.insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandlerHive.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() {
    return userDBHandlerHive.deleteMemberState();
  }

  bool checkIfLoggerInitialised() {
    return logger.checkIfLoggerInitialised();
  }

  Future<LMResponse<void>> initialiseLogger(
      {required InitiateLoggerRequest initiateLoggerRequest}) async {
    return logger.initialise(initiateLoggerRequest: initiateLoggerRequest);
  }

  void handleException(Exception exception, StackTrace stackTrace,
      {Severity errorSeverity = Severity.ERROR}) {
    logger.handleException(exception, stackTrace);
  }

  Future<void> flushLogs() {
    return logger.flushLogs();
  }

  Future<LMResponse<void>> insertSeenPostID(List<String> seenPostIds) {
    return seenPostDBHandler.insertSeenPostID(seenPostIds);
  }

  LMResponse<List<String>> getSeenPostIDs() {
    return seenPostDBHandler.getSeenPostIDs();
  }

  Future<LMResponse<void>> clearSeenPostIDs() {
    return seenPostDBHandler.clearSeenPostIDs();
  }

  /// save temp post to db
  Future<LMResponse<void>> saveTemporaryPost(SaveTemporaryPostRequest request) {
    return tempPostDBHandler.saveTemporaryPost(request);
  }

  /// delete temp post from db
  Future<LMResponse<void>> deleteTemporaryPost(
      DeleteTemporaryPostRequest deleteTemporaryPostRequest) {
    return tempPostDBHandler.deleteTemporaryPost(deleteTemporaryPostRequest);
  }

  /// get temp post from db
  LMResponse<Post> getTemporaryPost() {
    return tempPostDBHandler.getTemporaryPost();
  }

  /// clear temp post from db
  Future<LMResponse<void>> clearTemporaryPost() {
    return tempPostDBHandler.clearTemporaryPost();
  }
}
