import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IPostService {
  Future<AddPostResponseEntity> addPost(AddPostRequest addPostRequest);

  Future<GetPostResponseEntity> getPost(GetPostRequest getPostRequest);

  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest);

  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest);

  Future<LikePostResponseEntity> likePost(LikePostRequest likePostRequest);

  Future<PinPostResponseEntity> pinPost(PinPostRequest pinPostRequest);

  Future<SavePostResponseEntity> savePost(SavePostRequest savePostRequest);

  Future<EditPostResponseEntity> editPost(EditPostRequest editPostRequest);

  Future<PostReportResponseEntity> postReport(
      PostReportRequest postReportRequest);
}

class PostService extends IPostService {
  final ApiClient apiClient;

  PostService({
    required this.apiClient,
  });

  @override
  Future<AddPostResponseEntity> addPost(AddPostRequest addPostRequest) async {
    try {
      debugPrint("Access granted");
      final response = await apiClient.client().post(
            apiClient.getEndpoints.addPostEndpoint,
            data: addPostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from add post: ${response.data}");
      AddPostResponseEntity addPostResponseEntity =
          AddPostResponseEntity.fromJson(response.data);
      return addPostResponseEntity;
    } on DioException catch (e) {
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return AddPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
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
      debugPrint("Response from get post: ${response.data}");
      GetPostResponseEntity getPostResponseEntity =
          GetPostResponseEntity.fromJson(response.data);
      return getPostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from get post: $e");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<DeletePostResponseEntity> deletePost(
      DeletePostRequest deletePostRequest) async {
    try {
      final response = await apiClient.client().delete(
            "${apiClient.getEndpoints.addPostEndpoint}/${deletePostRequest.postId}",
            data: deletePostRequest.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from delete post: ${response.data}");
      DeletePostResponseEntity deletePostResponseEntity =
          DeletePostResponseEntity.fromJson(response.data);
      return deletePostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from delete post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return DeletePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
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
      debugPrint("Response from like post: ${response.data}");
      final postResponse = await getPost(
        (GetPostRequestBuilder()
              ..postId(likePostRequest.postId)
              ..page(1)
              ..pageSize(10))
            .build(),
      );
      LikePostResponseEntity likePostResponseEntity =
          LikePostResponseEntity.fromJson(response.data);
      likePostResponseEntity.setLikes = postResponse.post!.likeCount;
      return likePostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from like post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LikePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<GetPostLikesResponseEntity> getPostLikes(
      GetPostLikesRequest getPostLikesRequest) async {
    try {
      final response = await apiClient.client().get(
            "${apiClient.getEndpoints.addPostEndpoint}/${getPostLikesRequest.postId}/like",
            queryParameters: {
              'page': getPostLikesRequest.page,
              'page_size': getPostLikesRequest.pageSize,
            },
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      debugPrint("Response from get likes on post: ${response.data}");
      GetPostLikesResponseEntity getPostLikesResponseEntity =
          GetPostLikesResponseEntity.fromJson(response.data);
      return getPostLikesResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from like post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetPostLikesResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<PinPostResponseEntity> pinPost(PinPostRequest pinPostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${pinPostRequest.postId}/pin",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      PinPostResponseEntity pinPostResponseEntity =
          PinPostResponseEntity.fromJson(response.data);
      return pinPostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from pin post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PinPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<SavePostResponseEntity> savePost(
      SavePostRequest savePostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${savePostRequest.postId}/save",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      SavePostResponseEntity savePostResponseEntity =
          SavePostResponseEntity.fromJson(response.data);
      return savePostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from save post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return SavePostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<EditPostResponseEntity> editPost(
      EditPostRequest editPostRequest) async {
    try {
      final response = await apiClient.client().put(
            "${apiClient.getEndpoints.addPostEndpoint}/${editPostRequest.postId}",
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: editPostRequest.toJson(),
          );
      EditPostResponseEntity editPostResponseEntity =
          EditPostResponseEntity.fromJson(response.data);
      return editPostResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from edit post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return EditPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<PostReportResponseEntity> postReport(
      PostReportRequest postReportRequest) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.postReportEndpoint,
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
            data: postReportRequest.toJson(),
          );
      PostReportResponseEntity postReportResponseEntity =
          PostReportResponseEntity.fromJson(response.data);
      return postReportResponseEntity;
    } on DioException catch (e) {
      debugPrint("Error from report post: ${e.response?.data}");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PostReportResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
