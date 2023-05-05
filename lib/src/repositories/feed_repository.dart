import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';

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

  Future<EditCommentResponse?> editComment(
      EditCommentRequest editCommentRequest) async {
    final EditCommentResponseEntity? responseEntity =
        await commentService.editComment(editCommentRequest);

    return responseEntity != null
        ? EditCommentResponse.fromEntity(responseEntity)
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

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    final GetCommentLikesResponseEntity responseEntity =
        await commentService.getCommentLikes(request);
    return GetCommentLikesResponse.fromEntity(responseEntity);
  }

  Future<CommentDetailResponse?> getComment(
      CommentDetailRequest request) async {
    final CommentDetailResponseEntity? responseEntity =
        await commentService.getComment(request);
    return responseEntity != null
        ? CommentDetailResponse.fromEntity(responseEntity)
        : null;
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest request) async {
    final DeleteCommentResponseEntity responseEntity =
        await commentService.deleteComment(request);
    return DeleteCommentResponse.fromEntity(responseEntity);
  }

  Future<AddCommentReplyResponse?> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponseEntity? responseEntity =
        await commentService.addCommentReply(request);
    return responseEntity != null
        ? AddCommentReplyResponse.fromEntity(responseEntity)
        : null;
  }

  Future<EditCommentReplyResponse?> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponseEntity? responseEntity =
        await commentService.editCommentReply(request);
    return responseEntity != null
        ? EditCommentReplyResponse.fromEntity(responseEntity)
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
