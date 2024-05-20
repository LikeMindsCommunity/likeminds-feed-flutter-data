import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/web/user/handler/handler.dart';

LMFeedPersistence getPersistenceService() => LMFeedPersistenceWeb();

class LMFeedPersistenceWeb implements LMFeedPersistence {
  late LMUserDBHandlerHive userDBHandlerHive;

  LMFeedPersistenceWeb() {
    userDBHandlerHive = LMUserDBHandlerHive(
      userBoxName: 'userBox',
      memberStateBoxName: 'memberStateBox',
    );
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
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> deleteCache(String key) {
    throw UnimplementedError();
  }

  @override
  LMResponse<LMCache> getCache(String key) {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> clearCache() {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) {
    throw UnimplementedError();
  }

  @override
  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> clearCommunityConfigurationsDB() {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) {
    throw UnimplementedError();
  }

  @override
  LMResponse<MemberStateResponse> getMemberState() {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> deleteMemberState() {
    throw UnimplementedError();
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
