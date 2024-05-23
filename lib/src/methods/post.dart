import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';

class PostApi {
  final PostRepository postRepository;

  PostApi({required this.postRepository});

  Future<AddPostResponse> addPost(AddPostRequest addPostRequest) async {
    return await postRepository.addPost(addPostRequest);
  }

  Future<GetPostResponse> getPost(GetPostRequest getPostRequest) async {
    return await postRepository.getPost(getPostRequest);
  }

  Future<LMResponse<GetPendingPostResponse>> getPendingPost(
      GetPendingPostRequest getPostRequest) async {
    return await postRepository.getPendingPost(getPostRequest);
  }

  Future<LMResponse<GetAllPendingPostsResponse>> getAllPendingPosts(
      GetAllPendingPostsRequest getAllPendingPostsRequest) async {
    return await postRepository.getAllPendingPosts(getAllPendingPostsRequest);
  }

  Future<DeletePostResponse> deletePost(
      DeletePostRequest deletePostRequest) async {
    return await postRepository.deletePost(deletePostRequest);
  }

  Future<LMResponse<void>> deletePendingPost(
      DeletePendingPostRequest deletePostRequest) async {
    LMResponse<void> deletePostResponseEntity =
        await postRepository.deletePendingPost(deletePostRequest);
    return deletePostResponseEntity;
  }

  Future<LikePostResponse> likePost(LikePostRequest likePostRequest) async {
    return await postRepository.likePost(likePostRequest);
  }

  Future<GetPostLikesResponse> getPostLikes(
      GetPostLikesRequest getPostLikesRequest) async {
    return await postRepository.getPostLikes(getPostLikesRequest);
  }

  Future<PinPostResponse> pinPost(PinPostRequest pinPostRequest) async {
    return await postRepository.pinPost(pinPostRequest);
  }

  Future<SavePostResponse> savePost(SavePostRequest savePostRequest) async {
    return await postRepository.savePost(savePostRequest);
  }

  Future<EditPostResponse> editPost(EditPostRequest editPostRequest) async {
    return await postRepository.editPost(editPostRequest);
  }

  Future<LMResponse<EditPendingPostResponse>> editPendingPost(
      EditPendingPostRequest editPendingPostRequest) async {
    return await postRepository.editPendingPost(editPendingPostRequest);
  }

  Future<PostReportResponse> postReport(
      PostReportRequest postReportRequest) async {
    return await postRepository.postReport(postReportRequest);
  }

  Future<SearchPostResponse> searchPosts(
      SearchPostRequest searchPostRequest) async {
    return await postRepository.searchPosts(searchPostRequest);
  }

  Future<LMResponse<void>> submitPollVote(
      SubmitPollVoteRequest submitPollVoteRequest) async {
    return await postRepository.submitPollVote(submitPollVoteRequest);
  }

  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest addPollOptionRequest) async {
    return await postRepository.addPollOption(addPollOptionRequest);
  }

  Future<LMResponse<GetPollVotesResponse>> getPollVotes(
      GetPollVotesRequest getVotesRequest) async {
    return await postRepository.getPollVotes(getVotesRequest);
  }
}
