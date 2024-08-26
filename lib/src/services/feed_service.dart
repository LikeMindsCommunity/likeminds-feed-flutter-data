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
            apiClient.getEndpoints.getPostEndPoint(postDetailRequest.postId),
            queryParameters: postDetailRequest.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return PostDetailResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
            apiClient.getEndpoints.getUserCreatedPosts(request.uuid),
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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
      LMFeedPersistence.instance.handleException(e, stacktrace);
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

  Future<GetUserTopicsResponseEntity> getUserTopics(
      GetUserTopicsRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserTopicsEndpoint,
            queryParameters: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final GetUserTopicsResponseEntity responseEntity =
          GetUserTopicsResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final GetUserTopicsResponseEntity response = GetUserTopicsResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return response;
    }
  }

  Future<UpdateUserTopicsResponseEntity> updateUserTopics(
      UpdateUserTopicsRequest request) async {
    try {
      final response = await apiClient.client().patch(
            apiClient.getEndpoints.updateUserTopicsEndpoint(request.uuid),
            data: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final UpdateUserTopicsResponseEntity responseEntity =
          UpdateUserTopicsResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      final UpdateUserTopicsResponseEntity response =
          UpdateUserTopicsResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
      return response;
    }
  }

  Future<LMResponse<GetExploreFeedRoomResponseEntity>> getExploreFeedRooms(
      GetExploreFeedRoomRequest request) async {
    try {
      final Response response = await apiClient.client().get(
            apiClient.getEndpoints.exploreFeedroom,
            queryParameters: request.toJson(),
            options: Options(
              headers: {
                'x-accept-version': 'v3',
              },
            ),
          );

      Map<String, dynamic> data = response.data;

      if (data['success'] == false) {
        return LMResponse<GetExploreFeedRoomResponseEntity>(
          success: false,
          errorMessage: data['error_message'],
        );
      }

      return LMResponse<GetExploreFeedRoomResponseEntity>(
        success: true,
        data: GetExploreFeedRoomResponseEntity.fromJson(data['data']),
      );
    } on DioException catch (e, stacktrace) {
      LMFeedPersistence.instance.handleException(e, stacktrace);
      return LMResponse<GetExploreFeedRoomResponseEntity>(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  Future<LMResponse<void>> joinFeedRoom(JoinFeedRoomRequest request) async {
    try {
      final Response response = await apiClient.client().put(
            apiClient.getEndpoints.joinLeaveFeedroom,
            queryParameters: request.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );

      Map<String, dynamic> data = response.data;

      if (data['success'] == false) {
        return LMResponse<void>(
          success: false,
          errorMessage: data['error_message'],
        );
      }

      return LMResponse<void>(success: true);
    } on DioException catch (e, stacktrace) {
      LMFeedPersistence.instance.handleException(e, stacktrace);
      return LMResponse<void>(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  Future<LMResponse<GetPersonalisedFeedResponseEntity>> getPersonalisedFeed(
      GetPersonalisedFeedRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.personalisedFeed,
            queryParameters: request.toJson(),
          );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(
        data: GetPersonalisedFeedResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
