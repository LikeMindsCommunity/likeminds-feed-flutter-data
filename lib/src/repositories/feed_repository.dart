<<<<<<< HEAD
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/comment/add_comment_reply_request.dart';
import 'package:feed_sdk/src/models/comment/add_comment_reply_response.dart';
import 'package:feed_sdk/src/models/feed/comment_detail_request.dart';
import 'package:feed_sdk/src/models/feed/comment_detail_response.dart';
import 'package:feed_sdk/src/models/feed/post_detail_request.dart';
import 'package:feed_sdk/src/models/feed/post_detail_response.dart';
import 'package:feed_sdk/src/models/feed/toggle_like_comment_request.dart';
import 'package:feed_sdk/src/models/feed/toggle_like_comment_response.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
=======
>>>>>>> 6736be9 (Adding Feedrooms and member state)
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

  Future<CommentDetailResponse?> getComment(
      CommentDetailRequest request) async {
    final CommentDetailResponseEntity? responseEntity =
        await commentService.getComment(request);
    return responseEntity != null
        ? CommentDetailResponse.fromEntity(responseEntity)
        : null;
  }

  Future<AddCommentReplyResponse?> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponseEntity? responseEntity =
        await commentService.addCommentReply(request);
    return responseEntity != null
        ? AddCommentReplyResponse.fromEntity(responseEntity)
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
