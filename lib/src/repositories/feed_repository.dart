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

  Future<GetUserFeedResponse> getUserFeed(GetUserFeedRequest request) async {
    final GetUserFeedResponseEntity responseEntity =
        await feedService.getUserFeed(request);
    return GetUserFeedResponse.fromEntity(entity: responseEntity);
  }

  Future<GetSavedPostResponse> getSavedPosts(
      GetSavedPostRequest request) async {
    final GetSavedPostResponseEntity responseEntity =
        await feedService.getSavedPost(request);
    return GetSavedPostResponse.fromEntity(responseEntity);
  }
}
