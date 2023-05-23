import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/repositories/comment_repository.dart';

class CommentApi {
  CommentApi({required this.commentRepository});

  final CommentRepository commentRepository;

  Future<AddCommentResponse> addComment(
      AddCommentRequest addCommentRequest) async {
    final AddCommentResponse addCommentResponse =
        await commentRepository.addComment(addCommentRequest);
    return addCommentResponse;
  }

  Future<EditCommentResponse> editComment(
      EditCommentRequest editCommentRequest) async {
    final EditCommentResponse editCommentResponse =
        await commentRepository.editComment(editCommentRequest);
    return editCommentResponse;
  }

  Future<ToggleLikeCommentResponse> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponse response =
        await commentRepository.toggleLikeComment(request);
    return response;
  }

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    final GetCommentLikesResponse response =
        await commentRepository.getCommentLikes(request);
    return response;
  }

  Future<GetCommentResponse> getComment(GetCommentRequest request) async {
    final GetCommentResponse response =
        await commentRepository.getComment(request);
    return response;
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest request) async {
    final DeleteCommentResponse response =
        await commentRepository.deleteComment(request);
    return response;
  }

  Future<AddCommentReplyResponse> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponse response =
        await commentRepository.addCommentReply(request);
    return response;
  }

  Future<EditCommentReplyResponse> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponse response =
        await commentRepository.editCommentReply(request);
    return response;
  }
}
