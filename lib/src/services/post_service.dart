import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/endpoints.dart';
import 'package:likeminds_feed/src/models/post/add_post_request_model.dart';
import 'package:likeminds_feed/src/models/post/add_post_response_model.dart';
import 'package:likeminds_feed/src/models/post/delete_post_request_model.dart';
import 'package:likeminds_feed/src/models/post/delete_post_response_model.dart';
import 'package:likeminds_feed/src/models/post/get_likes_request_model.dart';
import 'package:likeminds_feed/src/models/post/get_likes_response_model.dart';
import 'package:likeminds_feed/src/models/post/get_post_request_model.dart';
import 'package:likeminds_feed/src/models/post/get_post_response_model.dart';
import 'package:likeminds_feed/src/models/post/like_post_request_model.dart';
import 'package:likeminds_feed/src/models/post/like_post_response_model.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IPostService {
  Future<AddPostResponseEntity> addPost(AddPostRequestEntity addPostRequest);
  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest);
  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest);
  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest);
  Future<LikePostResponseEntity> likePost(LikePostRequest likePostRequest);
}

class PostService extends IPostService {
  final ApiClient apiClient;

  PostService({
    required this.apiClient,
  });

  @override
  Future<AddPostResponseEntity> addPost(
      AddPostRequestEntity addPostRequest) async {
    try {
      print("Access granted");
      final response = await apiClient.client().post(
            apiClient.getEndpoints.addPostEndpoint,
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
            "${apiClient.getEndpoints.addPostEndpoint}/${getPostRequest.postId}",
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
            "${apiClient.getEndpoints.addPostEndpoint}/${deletePostRequest.postId}",
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

  @override
  Future<LikePostResponseEntity> likePost(
      LikePostRequest likePostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${likePostRequest.postId}/like",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from like post: ${response.data}");
      final postResponse = await getPost(GetPostRequest(
        postId: likePostRequest.postId,
        page: 1,
        pageSize: 10,
      ));
      LikePostResponseEntity likePostResponseEntity =
          LikePostResponseEntity.fromJson(response.data);
      likePostResponseEntity.setLikes = postResponse.post!.likeCount;
      return likePostResponseEntity;
    } on DioError catch (e) {
      print("Error from like post: ${e.response?.data}");
      LikePostResponseEntity likePostResponseEntity =
          LikePostResponseEntity.fromJson(e.response?.data);
      return likePostResponseEntity;
    }
  }

  @override
  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest) async {
    try {
      final response = await apiClient.client().get(
            "${apiClient.getEndpoints.addPostEndpoint}/${getPostLikesRequest.postId}/like",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      print("Response from get likes on post: ${response.data}");
      GetPostLikesResponseEntity getPostLikesResponseEntity =
          GetPostLikesResponseEntity.fromJson(response.data);
      return getPostLikesResponseEntity;
    } on DioError catch (e) {
      print("Error from like post: ${e.response?.data}");
      return GetPostLikesResponseEntity(
        success: false,
        errorMessage: "${e.response?.data}",
      );
    }
  }
}
