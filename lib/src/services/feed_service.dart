import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;

  FeedService({required this.apiClient});

  Future<PostDetailResponseEntity> getPost(
      PostDetailRequest postDetailRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getPostEndPoint(
                postDetailRequest.postId, postDetailRequest.page),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return PostDetailResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PostDetailResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    } on Exception catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      return PostDetailResponseEntity(
          success: false, errorMessage: "An error occurred");
    }
  }

  Future<GetFeedResponseEntity> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.universalFeed,
            queryParameters: universalFeedRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return GetFeedResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetFeedResponseEntity responseEntity = GetFeedResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return responseEntity;
    }
  }

  Future<GetFeedRoomResponseEntity> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    final Map<String, dynamic> queryParameters = {
      'page': getFeedRoomRequest.page,
    };
    if (getFeedRoomRequest.feedroomId != null) {
      queryParameters['feedroom_id'] = getFeedRoomRequest.feedroomId;
    }
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.feedroomEndpoint,
            queryParameters: queryParameters,
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final GetFeedRoomResponseEntity responseEntity =
          GetFeedRoomResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetFeedRoomResponseEntity responseEntity =
          GetFeedRoomResponseEntity(
        success: false,
        chatroom: null,
        participantCount: null,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return responseEntity;
    }
  }

  Future<GetFeedOfFeedRoomResponseEntity> getFeedOfFeedRoom(
      GetFeedOfFeedRoomRequest feedRoomRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.feedOfFeedroomEndpoint,
            queryParameters: feedRoomRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return GetFeedOfFeedRoomResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetFeedOfFeedRoomResponseEntity responseEntity =
          GetFeedOfFeedRoomResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
        posts: [],
        users: {},
        topics: {},
      );
      return responseEntity;
    }
  }

  Future<GetTopicsResponseEntity> getTopics(GetTopicsRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.topicFeedEndpoint,
            queryParameters: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final GetTopicsResponseEntity responseEntity =
          GetTopicsResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetTopicsResponseEntity response = GetTopicsResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
        topics: [],
      );
      return response;
    }
  }

  Future<GetUserPostResponseEntity> getUserCreatedPosts(
      GetUserPostRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserCreatedPosts(request.userId),
            queryParameters: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final GetUserPostResponseEntity responseEntity =
          GetUserPostResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetUserPostResponseEntity response = GetUserPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return response;
    }
  }

  Future<GetSavedPostResponseEntity> getSavedPost(
      GetSavedPostRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserSavedPostEndPoint(request.uuid),
            queryParameters: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return GetSavedPostResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetSavedPostResponseEntity response = GetSavedPostResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return response;
    }
  }
}
