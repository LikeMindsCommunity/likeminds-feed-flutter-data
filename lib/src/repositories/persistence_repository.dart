import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/persistence_service.dart';

class PersistenceRepository {
  final PersistenceService persistenceService;

  PersistenceRepository({required this.persistenceService});

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return persistenceService.insertOrUpdateUser(user);
  }

  LMResponse<User> getUserDB() {
    return persistenceService.getUserDB();
  }

  Future<LMResponse<void>> deleteUserDB() async {
    return persistenceService.deleteUserDB();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    return persistenceService.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return persistenceService.deleteCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return persistenceService.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return persistenceService.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurationDB(
      List<CommunityConfigurations> communityConfiguration) async {
    return persistenceService
        .insertOrUpdateCommunityConfiguration(communityConfiguration);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationDB(String type) {
    return persistenceService.getCommunityConfigurationsDB(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationDB(String type) async {
    return persistenceService.deleteCommunityConfigurationsDB(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationDB() async {
    return persistenceService.clearCommunityConfigurationsDB();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await persistenceService
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return persistenceService.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await persistenceService.deleteMemberState();
  }

  /// save temp post to db
  Future<LMResponse<void>> saveTemporaryPost(SaveTemporaryPostRequest request) {
    return persistenceService.saveTemporaryPost(request);
  }

  /// delete temp post from db
  Future<LMResponse<void>> deleteTemporaryPost(
      DeleteTemporaryPostRequest deleteTemporaryPostRequest) {
    return persistenceService.deleteTemporaryPost(deleteTemporaryPostRequest);
  }

  /// get temp post from db
  LMResponse<Post> getTemporaryPost() {
    return persistenceService.getTemporaryPost();
  }

  /// clear temp post from db
  Future<LMResponse<void>> clearTemporaryPost() {
    return persistenceService.clearTemporaryPost();
  }
}
