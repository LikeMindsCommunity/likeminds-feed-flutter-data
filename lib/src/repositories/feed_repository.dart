import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';

class FeedRepository {
  FeedRepository({required this.feedService});
  final FeedService feedService;

  Future<GetFeedResponse?> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    final GetFeedResponseEntity? responseEntity =
        await feedService.getUniversalFeed(universalFeedRequest);
    return responseEntity != null
        ? GetFeedResponse.fromEntity(entity: responseEntity)
        : null;
  }

  Future<PostDetailResponse?> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponseEntity? responseEntity =
        await feedService.getPost(postDetailRequest);

    return responseEntity != null
        ? PostDetailResponse.fromEntity(responseEntity)
        : null;
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
}
