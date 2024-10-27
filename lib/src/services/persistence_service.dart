import 'package:likeminds_feed/likeminds_feed.dart';

class PersistenceService {
  LMFeedPersistence? feedPersistence;

  PersistenceService() {
    feedPersistence = LMFeedPersistence.instance;
  }

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return await feedPersistence!.insertOrUpdateUser(user);
  }

  LMResponse<User> getUserDB() {
    return feedPersistence!.getUserDB();
  }

  Future<LMResponse<void>> deleteUserDB() async {
    return await feedPersistence!.deleteUserDB();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    return await feedPersistence!.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return await feedPersistence!.deleteCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return feedPersistence!.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return await feedPersistence!.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfiguration(
      List<CommunityConfigurations> communityConfigurations) async {
    return await feedPersistence!
        .insertOrUpdateCommunityConfiguration(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationsDB(
      String type) {
    return feedPersistence!.getCommunityConfigurationsDB(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationsDB(String type) async {
    return await feedPersistence!.deleteCommunityConfigurationsDB(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationsDB() async {
    return await feedPersistence!.clearCommunityConfigurationsDB();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await feedPersistence!
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return feedPersistence!.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await feedPersistence!.deleteMemberState();
  }

  /// save temp post to db
  Future<LMResponse<void>> saveTemporaryPost(Post post) {
    return feedPersistence!.saveTemporaryPost(post);
  }

  /// delete temp post from db
  Future<LMResponse<void>> deleteTemporaryPost(String tempId) {
    return feedPersistence!.deleteTemporaryPost(tempId);
  }

  /// get temp post from db
  LMResponse<Post> getTemporaryPost() {
    return feedPersistence!.getTemporaryPost();
  }
}
