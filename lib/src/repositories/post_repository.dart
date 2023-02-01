import 'package:feed_sdk/src/models/post/add_post_request_model.dart';
import 'package:feed_sdk/src/models/post/add_post_response_model.dart';
import 'package:feed_sdk/src/models/post/delete_post_request_model.dart';
import 'package:feed_sdk/src/models/post/delete_post_response_model.dart';
import 'package:feed_sdk/src/models/post/get_likes_request_model.dart';
import 'package:feed_sdk/src/models/post/get_likes_response_model.dart';
import 'package:feed_sdk/src/models/post/get_post_request_model.dart';
import 'package:feed_sdk/src/models/post/get_post_response_model.dart';
import 'package:feed_sdk/src/models/post/like_post_request_model.dart';
import 'package:feed_sdk/src/models/post/like_post_response_model.dart';
import 'package:feed_sdk/src/services/post_service.dart';

class PostRepository {
  final PostService postService;

  PostRepository({required this.postService});

  Future<AddPostResponse> addPost(AddPostRequest addPostRequest) async {
    AddPostResponseEntity addPostResponseEntity =
        await postService.addPost(addPostRequest.toEntity());
    return AddPostResponse.fromEntity(entity: addPostResponseEntity);
  }

  Future<GetPostResponse> getPost(GetPostRequest getPostRequest) async {
    GetPostResponseEntity getPostResponseEntity =
        await postService.getPost(getPostRequest);
    return GetPostResponse.fromEntity(entity: getPostResponseEntity);
  }

  Future<DeletePostResponse> deletePost(
      DeletePostRequest deletePostRequest) async {
    DeletePostResponseEntity deletePostResponseEntity =
        await postService.deletePost(deletePostRequest);
    return DeletePostResponse.fromEntity(deletePostResponseEntity);
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
}
