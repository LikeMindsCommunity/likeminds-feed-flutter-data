import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/models/post/post_report_request.dart';
import 'package:likeminds_feed/src/models/post/post_report_response.dart';
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

  Future<DeletePostResponse> deletePost(
      DeletePostRequest deletePostRequest) async {
    return await postRepository.deletePost(deletePostRequest);
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

  Future<PostReportResponse> postReport(
      PostReportRequest postReportRequest) async {
    return await postRepository.postReport(postReportRequest);
  }
}
