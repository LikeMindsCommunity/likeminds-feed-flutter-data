import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/repositories/persistence_repository.dart';

class PersistenceApi {
  final PersistenceRepository persistenceRepository;

  PersistenceApi({required this.persistenceRepository});

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return persistenceRepository.insertOrUpdateUser(user);
  }

  LMResponse<User> getUserDB() {
    return persistenceRepository.getUserDB();
  }

  Future<LMResponse<void>> deleteUserDB() async {
    return persistenceRepository.deleteUserDB();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    return persistenceRepository.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return persistenceRepository.deleteCache(key);
  }

  LMResponse<LMCache> getCache(String key) {
    return persistenceRepository.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return persistenceRepository.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurationDB(
      List<CommunityConfigurations> communityConfiguration) async {
    return persistenceRepository
        .insertOrUpdateCommunityConfigurationDB(communityConfiguration);
  }

  LMResponse<CommunityConfigurations> getCommunityConfigurationDB(String type) {
    return persistenceRepository.getCommunityConfigurationDB(type);
  }

  Future<LMResponse<void>> deleteCommunityConfigurationDB(String type) async {
    return persistenceRepository.deleteCommunityConfigurationDB(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationDB() async {
    return persistenceRepository.clearCommunityConfigurationDB();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await persistenceRepository
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return persistenceRepository.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await persistenceRepository.deleteMemberState();
  }

  /// save temp post to db
  Future<LMResponse<void>> saveTemporaryPost(Post post) {
    return persistenceRepository.saveTemporaryPost(post);
  }

  /// delete temp post from db
  Future<LMResponse<void>> deleteTemporaryPost(String tempId) {
    return persistenceRepository.deleteTemporaryPost(tempId);
  }

  /// get temp post from db
  LMResponse<Post> getTemporaryPost() {
    return persistenceRepository.getTemporaryPost();
  }
}
