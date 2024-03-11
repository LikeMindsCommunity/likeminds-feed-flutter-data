import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';

class FeedApi {
  FeedApi({required this.feedRepository});

  final FeedRepository feedRepository;

  Future<GetFeedResponse> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    final GetFeedResponse universalFeedResponse =
        await feedRepository.getUniversalFeed(universalFeedRequest);
    return universalFeedResponse;
  }

  Future<PostDetailResponse> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponse postDetailResponse =
        await feedRepository.getPost(postDetailRequest);
    return postDetailResponse;
  }

  Future<GetFeedRoomResponse> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final GetFeedRoomResponse response =
        await feedRepository.getFeedRoom(getFeedRoomRequest);
    return response;
  }

  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest getFeedFeedRoomRequest) async {
    final GetFeedOfFeedRoomResponse response =
        await feedRepository.getFeedOfFeedRoom(getFeedFeedRoomRequest);
    return response;
  }

  Future<GetTopicsResponse> getTopics(GetTopicsRequest request) async {
    final GetTopicsResponse response = await feedRepository.getTopics(request);
    return response;
  }

  Future<GetUserPostResponse> getUserCreatedPosts(
      GetUserPostRequest request) async {
    final GetUserPostResponse response =
        await feedRepository.getUserCreatedPosts(request);
    return response;
  }

  Future<GetSavedPostResponse> getSavedPost(GetSavedPostRequest request) async {
    final GetSavedPostResponse response =
        await feedRepository.getSavedPosts(request);
    return response;
  }
}
