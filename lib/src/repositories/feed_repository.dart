import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';

class FeedRepository {
  FeedRepository({required this.feedService});
  final FeedService feedService;

  Future<GetFeedResponse> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    final GetFeedResponseEntity responseEntity =
        await feedService.getUniversalFeed(universalFeedRequest);
    return GetFeedResponse.fromEntity(entity: responseEntity);
  }

  Future<PostDetailResponse> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponseEntity responseEntity =
        await feedService.getPost(postDetailRequest);

    return PostDetailResponse.fromEntity(responseEntity);
  }

  Future<GetFeedRoomResponse> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final GetFeedRoomResponseEntity responseEntity =
        await feedService.getFeedRoom(getFeedRoomRequest);
    final GetFeedRoomResponse response =
        GetFeedRoomResponse.fromEntity(responseEntity);
    return response;
  }

  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest getFeedFeedRoomRequest) async {
    final GetFeedOfFeedRoomResponseEntity responseEntity =
        await feedService.getFeedOfFeedRoom(getFeedFeedRoomRequest);
    return GetFeedOfFeedRoomResponse.fromEntity(entity: responseEntity);
  }

  Future<GetTopicsResponse> getTopics(GetTopicsRequest request) async {
    final GetTopicsResponseEntity responseEntity =
        await feedService.getTopics(request);
    return GetTopicsResponse.fromEntity(responseEntity);
  }

  Future<GetUserPostResponse> getUserCreatedPosts(
      GetUserPostRequest request) async {
    final GetUserPostResponseEntity responseEntity =
        await feedService.getUserCreatedPosts(request);
    return GetUserPostResponse.fromEntity(entity: responseEntity);
  }

  Future<GetSavedPostResponse> getSavedPosts(
      GetSavedPostRequest request) async {
    final GetSavedPostResponseEntity responseEntity =
        await feedService.getSavedPost(request);
    return GetSavedPostResponse.fromEntity(responseEntity);
  }

  Future<UpdateUserTopicsResponse> updateUserTopics(
      UpdateUserTopicsRequest request) async {
    final UpdateUserTopicsResponseEntity responseEntity =
        await feedService.updateUserTopics(request);
    return UpdateUserTopicsResponse.fromEntity(responseEntity);
  }

  Future<GetUserTopicsResponse> getUserTopics(
      GetUserTopicsRequest request) async {
    final GetUserTopicsResponseEntity responseEntity =
        await feedService.getUserTopics(request);
    return GetUserTopicsResponse.fromEntity(responseEntity);
  }

  Future<LMResponse<GetExploreFeedRoomResponse>> getExploreFeedRooms(
      GetExploreFeedRoomRequest request) async {
    final LMResponse<GetExploreFeedRoomResponseEntity> responseEntity =
        await feedService.getExploreFeedRooms(request);
    if (responseEntity.data == null) {
      return LMResponse<GetExploreFeedRoomResponse>(
        errorMessage: responseEntity.errorMessage,
        success: responseEntity.success,
      );
    }
    return LMResponse<GetExploreFeedRoomResponse>(
      data: GetExploreFeedRoomResponse.fromEntity(responseEntity.data!),
      errorMessage: responseEntity.errorMessage,
      success: responseEntity.success,
    );
  }

  Future<LMResponse<void>> joinFeedRoom(
      JoinFeedRoomRequest followUnFollowRequest) async {
    final LMResponse<void> responseEntity =
        await feedService.joinFeedRoom(followUnFollowRequest);
    return responseEntity;
  }

  Future<LMResponse<GetPersonalisedFeedResponse>> getPersonalisedFeed(
      GetPersonalisedFeedRequest request) async {
    final LMResponse<GetPersonalisedFeedResponseEntity> responseEntity =
        await feedService.getPersonalisedFeed(request);
    if (!responseEntity.success || responseEntity.data == null) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetPersonalisedFeedResponse.fromEntity(
        entity: responseEntity.data!,
      ),
    );
  }

  Future<LMResponse<void>> postSeen(PostSeenRequest request) async {
    final LMResponse<void> responseEntity = await feedService.postSeen(request);
    return responseEntity;
  }
}
