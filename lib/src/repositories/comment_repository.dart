import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';

class CommentRepository {
  CommentRepository({required this.commentService});
  final CommentService commentService;

  Future<AddCommentResponse> addComment(
      AddCommentRequest addCommentRequest) async {
    final AddCommentResponseEntity responseEntity =
        await commentService.addComment(addCommentRequest);

    return AddCommentResponse.fromEntity(responseEntity);
  }

  Future<EditCommentResponse> editComment(
      EditCommentRequest editCommentRequest) async {
    final EditCommentResponseEntity responseEntity =
        await commentService.editComment(editCommentRequest);

    return EditCommentResponse.fromEntity(responseEntity);
  }

  Future<ToggleLikeCommentResponse> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponseEntity responseEntity =
        await commentService.toggleLikeComment(request);
    return ToggleLikeCommentResponse.fromEntity(responseEntity);
  }

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    final GetCommentLikesResponseEntity responseEntity =
        await commentService.getCommentLikes(request);
    return GetCommentLikesResponse.fromEntity(responseEntity);
  }

  Future<GetCommentResponse> getComment(GetCommentRequest request) async {
    final GetCommentResponseEntity responseEntity =
        await commentService.getComment(request);
    return GetCommentResponse.fromEntity(responseEntity);
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest request) async {
    final DeleteCommentResponseEntity responseEntity =
        await commentService.deleteComment(request);
    return DeleteCommentResponse.fromEntity(responseEntity);
  }

  Future<AddCommentReplyResponse> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponseEntity responseEntity =
        await commentService.addCommentReply(request);
    return AddCommentReplyResponse.fromEntity(responseEntity);
  }

  Future<EditCommentReplyResponse> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponseEntity responseEntity =
        await commentService.editCommentReply(request);
    return EditCommentReplyResponse.fromEntity(responseEntity);
  }
}
