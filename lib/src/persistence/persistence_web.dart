import 'package:likeminds_feed/likeminds_feed.dart';

LMFeedPersistence getPersistenceService() => LMFeedPersistenceWeb();

class LMFeedPersistenceWeb implements LMFeedPersistence {
  @override
  Future<LMResponse<void>> insertOrUpdateUser(User user) {
    throw UnimplementedError();
  }

  @override
  LMResponse<User> getUserDB() {
    throw UnimplementedError();
  }

  @override
  Future<LMResponse<void>> deleteUserDB() {
    throw UnimplementedError();
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
