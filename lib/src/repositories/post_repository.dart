import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/post_service.dart';

class PostRepository {
  final PostService postService;

  PostRepository({required this.postService});

  Future<AddPostResponse> addPost(AddPostRequest addPostRequest) async {
    AddPostResponseEntity addPostResponseEntity =
        await postService.addPost(addPostRequest);
    return AddPostResponse.fromEntity(entity: addPostResponseEntity);
  }

  Future<GetPostResponse> getPost(GetPostRequest getPostRequest) async {
    GetPostResponseEntity getPostResponseEntity =
        await postService.getPost(getPostRequest);
    return GetPostResponse.fromEntity(entity: getPostResponseEntity);
  }

  Future<LMResponse<GetPendingPostResponse>> getPendingPost(
      GetPendingPostRequest getPendingPostRequest) async {
    final getPendingPostResponseEntity =
        await postService.getPendingPost(getPendingPostRequest);
    return LMResponse(
      success: getPendingPostResponseEntity.success,
      errorMessage: getPendingPostResponseEntity.errorMessage,
      data: getPendingPostResponseEntity.data != null
          ? GetPendingPostResponse.fromEntity(
              entity: getPendingPostResponseEntity.data!)
          : null,
    );
  }

  Future<LMResponse<GetAllPendingPostsResponse>> getAllPendingPosts(
      GetAllPendingPostsRequest getAllPendingPostsRequest) async {
    final getAllPendingPostsResponseEntity =
        await postService.getAllPendingPosts(getAllPendingPostsRequest);
    return LMResponse(
      success: getAllPendingPostsResponseEntity.success,
      errorMessage: getAllPendingPostsResponseEntity.errorMessage,
      data: getAllPendingPostsResponseEntity.data != null
          ? getAllPendingPostsResponseEntity.data!.toResponse()
          : null,
    );
  }

  Future<DeletePostResponse> deletePost(
      DeletePostRequest deletePostRequest) async {
    DeletePostResponseEntity deletePostResponseEntity =
        await postService.deletePost(deletePostRequest);
    return DeletePostResponse.fromEntity(deletePostResponseEntity);
  }

  Future<LMResponse<void>> deletePendingPost(
      DeletePendingPostRequest deletePostRequest) async {
    LMResponse<void> deletePostResponseEntity =
        await postService.deletePendingPost(deletePostRequest);
    return deletePostResponseEntity;
  }

  Future<LikePostResponse> likePost(LikePostRequest likePostRequest) async {
    LikePostResponseEntity likePostResponseEntity =
        await postService.likePost(likePostRequest);
    return LikePostResponse.fromEntity(likePostResponseEntity);
  }

  Future<GetPostLikesResponse> getPostLikes(
      GetPostLikesRequest getPostLikesRequest) async {
    GetPostLikesResponseEntity getPostLikesResponseEntity =
        await postService.getPostLikes(getPostLikesRequest);
    return GetPostLikesResponse.fromEntity(getPostLikesResponseEntity);
  }

  Future<PinPostResponse> pinPost(PinPostRequest pinPostRequest) async {
    PinPostResponseEntity pinPostResponseEntity =
        await postService.pinPost(pinPostRequest);
    return PinPostResponse.fromEntity(pinPostResponseEntity);
  }

  Future<SavePostResponse> savePost(SavePostRequest savePostRequest) async {
    SavePostResponseEntity savePostResponseEntity =
        await postService.savePost(savePostRequest);
    return SavePostResponse.fromEntity(savePostResponseEntity);
  }

  Future<EditPostResponse> editPost(EditPostRequest editPostRequest) async {
    EditPostResponseEntity editPostResponseEntity =
        await postService.editPost(editPostRequest);
    return EditPostResponse.fromEntity(editPostResponseEntity);
  }

  Future<LMResponse<EditPendingPostResponse>> editPendingPost(
      EditPendingPostRequest editPendingPostRequest) async {
    LMResponse<EditPendingPostResponseEntity> response =
        await postService.editPendingPost(editPendingPostRequest);
    return LMResponse(
        success: response.success,
        errorMessage: response.errorMessage,
        data: response.data != null
            ? EditPendingPostResponse.fromEntity(response.data!)
            : null);
  }

  Future<PostReportResponse> postReport(
      PostReportRequest postReportRequest) async {
    PostReportResponseEntity postReportResponseEntity =
        await postService.postReport(postReportRequest);
    return PostReportResponse.fromEntity(postReportResponseEntity);
  }

  Future<SearchPostResponse> searchPosts(
      SearchPostRequest searchPostRequest) async {
    SearchPostResponseEntity searchPostResponseEntity =
        await postService.searchPosts(searchPostRequest);
    return SearchPostResponse.fromEntity(searchPostResponseEntity);
  }

  Future<LMResponse<void>> submitPollVote(
      SubmitPollVoteRequest submitPollVoteRequest) async {
    return await postService.submitPollVote(submitPollVoteRequest);
  }

  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest addPollOptionRequest) async {
    final addPollOptionResponseEntity =
        await postService.addPollOption(addPollOptionRequest);
    return LMResponse(
      success: addPollOptionResponseEntity.success,
      errorMessage: addPollOptionResponseEntity.errorMessage,
      data: addPollOptionResponseEntity.data != null
          ? AddPollOptionResponse.fromEntity(
              addPollOptionResponseEntity.data!,
            )
          : null,
    );
  }

  Future<LMResponse<GetPollVotesResponse>> getPollVotes(
      GetPollVotesRequest request) async {
    final getVotesResponseEntity = await postService.getPollVotes(request);
    return LMResponse(
      success: getVotesResponseEntity.success,
      errorMessage: getVotesResponseEntity.errorMessage,
      data: getVotesResponseEntity.data != null
          ? GetPollVotesResponse.fromEntity(
              getVotesResponseEntity.data!,
            )
          : null,
    );
  }
}
