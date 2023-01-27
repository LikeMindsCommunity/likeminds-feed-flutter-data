import 'package:dio/dio.dart';
import 'package:feed_sdk/src/endpoints.dart';
import 'package:feed_sdk/src/models/post/add_post_request_model.dart';
import 'package:feed_sdk/src/models/post/add_post_response_model.dart';
import 'package:feed_sdk/src/models/post/delete_post_request_model.dart';
import 'package:feed_sdk/src/models/post/delete_post_response_model.dart';
import 'package:feed_sdk/src/models/post/get_post_request_model.dart';
import 'package:feed_sdk/src/models/post/get_post_response_model.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

abstract class IPostService {
  Future<AddPostResponseEntity> addPost(AddPostRequestEntity addPostRequest);
  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest);
  // Future<GetPostLikesResponse> getPostLikes(
  //     GetPostLikesRequest getPostLikesRequest);
  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest);
  // Future<LikePostResponse> likePost(LikePostResponse likePostResponse);
}

class PostService extends IPostService {
  final String apiKey;
  final ApiClient apiClient;

  PostService({
    required this.apiKey,
    required this.apiClient,
  });

  @override
  Future<AddPostResponseEntity> addPost(
      AddPostRequestEntity addPostRequest) async {
    try {
      final response = await apiClient.client().post(
            ADD_POST_ENDPOINT,
            data: addPostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from add post: ${response.data}");
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(response.data);
      return addPostResponseEntity;
    } on DioError catch (e) {
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(e.response?.data);
      return addPostResponseEntity;
    }
  }

  @override
  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest) async {
    try {
      final response = await apiClient.client().get(
            "$ADD_POST_ENDPOINT/${getPostRequest.postId}",
            queryParameters: {
              'page': getPostRequest.page,
              'page_size': getPostRequest.pageSize,
            },
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from get post: ${response.data}");
      GetPostResponseEntity getPostResponseEntity =
          GetPostResponseEntity.fromJson(response.data);
      return getPostResponseEntity;
    } on DioError catch (e) {
      print("Error from get post: $e");
      GetPostResponseEntity getPostResponseEntity =
          GetPostResponseEntity.fromJson(e.response?.data);
      return getPostResponseEntity;
    }
  }

  @override
  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest) async {
    try {
      final response = await apiClient.client().delete(
            "$ADD_POST_ENDPOINT/${deletePostRequest.postId}",
            data: {"delete_reason": deletePostRequest.deleteReason},
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from delete post: ${response.data}");
      DeletePostResponseEntity deletePostResponseEntity =
          DeletePostResponseEntity.fromJson(response.data);
      return deletePostResponseEntity;
    } on DioError catch (e) {
      print("Error from delete post: ${e.response?.data}");
      DeletePostResponseEntity deletePostResponseEntity =
          DeletePostResponseEntity.fromJson(e.response?.data);
      return deletePostResponseEntity;
    }
  }
}
