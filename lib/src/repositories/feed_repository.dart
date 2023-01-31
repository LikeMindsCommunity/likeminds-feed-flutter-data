import 'package:feed_sdk/src/models/models.dart';
import 'package:feed_sdk/src/services/auth_service.dart';
import 'package:feed_sdk/src/services/comment_service.dart';
import 'package:feed_sdk/src/services/feed_service.dart';

class FeedRepository {
  FeedRepository({required this.feedService, required this.commentService});
  final FeedService feedService;
  final CommentService commentService;

  Future<UniversalFeedResponse?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    final UniversalFeedResponseEntity? responseEntity =
        await feedService.getUniversalFeed(universalFeedRequest);
    return responseEntity != null
        ? UniversalFeedResponse.fromEntity(entity: responseEntity)
        : null;
  }

  Future<PostDetailResponse?> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponseEntity? responseEntity =
        await commentService.getPost(postDetailRequest);

    return responseEntity != null
        ? PostDetailResponse.fromEntity(responseEntity)
        : null;
  }

  Future<AddCommentResponse?> addComment(
      AddCommentRequest addCommentRequest) async {
    final AddCommentResponseEntity? responseEntity =
        await commentService.addComment(addCommentRequest);

    return responseEntity != null
        ? AddCommentResponse.fromEntity(responseEntity)
        : null;
  }

  Future<ToggleLikeCommentResponse?> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponseEntity? responseEntity =
        await commentService.toggleLikeComment(request);
    return responseEntity != null
        ? ToggleLikeCommentResponse.fromEntity(responseEntity)
        : null;
  }

  Future<GetFeedRoomResponse> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final GetFeedRoomResponseEntity responseEntity =
        await feedService.getFeedRoom(getFeedRoomRequest);
    return GetFeedRoomResponse.fromEntity(responseEntity);
  }

  Future<GetFeedOfFeedRoomResponse> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest getFeedFeedRoomRequest) async {
    final GetFeedOfFeedRoomResponseEntity responseEntity =
        await feedService.getFeedOfFeedRoom(getFeedFeedRoomRequest);
    return GetFeedOfFeedRoomResponse.fromEntity(entity: responseEntity);
  }
}
