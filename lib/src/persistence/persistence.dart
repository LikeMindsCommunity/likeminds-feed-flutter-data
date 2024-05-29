import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/persistence_imp.dart'
    if (dart.library.io) 'package:likeminds_feed/src/persistence/persistence_mobile.dart'
    if (dart.library.html) 'package:likeminds_feed/src/persistence/persistence_web.dart';

abstract class LMFeedPersistence {
  Future<LMResponse<void>> init();

  Future<LMResponse<void>> insertOrUpdateUser(User user);
  LMResponse<User> getUserDB();
  Future<LMResponse<void>> deleteUserDB();

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache);
  Future<LMResponse<void>> deleteCache(String key);
  LMResponse<LMCache> getCache(String key);
  Future<LMResponse<void>> clearCache();

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
    List<CommunityConfigurations> communityConfigurations,
  );
  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(String type);
  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type);
  Future<LMResponse<void>> clearCommunityConfigurationsDB();

  Future<LMResponse<void>> insertOrUpdateMemberState(
    MemberStateResponse memberStateResponse,
  );
  LMResponse<MemberStateResponse> getMemberState();
  Future<LMResponse<void>> deleteMemberState();

  bool checkIfLoggerInitialised();

  void initialiseLogger({required InitiateLoggerRequest initiateLoggerRequest});

  void handleException(Exception exception, StackTrace stackTrace,
      {Severity errorSeverity = Severity.ERROR});

  Future<void> flushLogs();

  static LMFeedPersistence? _instance;

  static LMFeedPersistence get instance =>
      _instance ??= getPersistenceService();
}
