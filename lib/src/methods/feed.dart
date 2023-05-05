import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';

class FeedApi {
  FeedApi({required this.feedRepository});

  final FeedRepository feedRepository;

  Future<UniversalFeedResponse?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    final UniversalFeedResponse? universalFeedResponse =
        await feedRepository.getUniversalFeed(universalFeedRequest);
    return universalFeedResponse;
  }

  Future<PostDetailResponse?> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponse? postDetailResponse =
        await feedRepository.getPost(postDetailRequest);
    return postDetailResponse;
  }

  Future<AddCommentResponse?> addComment(
      AddCommentRequest addCommentRequest) async {
    final AddCommentResponse? addCommentResponse =
        await feedRepository.addComment(addCommentRequest);
    return addCommentResponse;
  }

  Future<EditCommentResponse?> editComment(
      EditCommentRequest editCommentRequest) async {
    final EditCommentResponse? editCommentResponse =
        await feedRepository.editComment(editCommentRequest);
    return editCommentResponse;
  }

  Future<ToggleLikeCommentResponse?> toggleLikeComment(
      ToggleLikeCommentRequest request) async {
    final ToggleLikeCommentResponse? response =
        await feedRepository.toggleLikeComment(request);
    return response;
  }

  Future<GetCommentLikesResponse> getCommentLikes(
      GetCommentLikesRequest request) async {
    final GetCommentLikesResponse response =
        await feedRepository.getCommentLikes(request);
    return response;
  }

  Future<CommentDetailResponse?> getComment(
      CommentDetailRequest request) async {
    final CommentDetailResponse? response =
        await feedRepository.getComment(request);
    return response;
  }

  Future<DeleteCommentResponse> deleteComment(
      DeleteCommentRequest request) async {
    final DeleteCommentResponse response =
        await feedRepository.deleteComment(request);
    return response;
  }

  Future<AddCommentReplyResponse?> addCommentReply(
      AddCommentReplyRequest request) async {
    final AddCommentReplyResponse? response =
        await feedRepository.addCommentReply(request);
    return response;
  }

  Future<EditCommentReplyResponse?> editCommentReply(
      EditCommentReplyRequest request) async {
    final EditCommentReplyResponse? response =
        await feedRepository.editCommentReply(request);
    return response;
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
}
