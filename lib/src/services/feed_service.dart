import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/feed/user_feed_request.dart';
import 'package:likeminds_feed/src/models/feed/user_feed_response.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;
  FeedService({required this.apiClient});
  // final String authHost = "https://betaauth.likeminds.community/feed/";

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
    } on DioError catch (e) {
      debugPrint(e.toString());
      return PostDetailResponseEntity(
          success: false,
          errorMessage: "An error occured, please try again later");
    } catch (e) {
      debugPrint(e.toString());
      return PostDetailResponseEntity(
          success: false,
          errorMessage: "An error occured, please try again later");
    }
  }

  Future<GetFeedResponseEntity?> getUniversalFeed(
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
    } on DioError catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
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
    } on DioError catch (e) {
      final GetFeedRoomResponseEntity responseEntity =
          GetFeedRoomResponseEntity(
        success: false,
        chatroom: null,
        participantCount: null,
        errorMessage: e.toString(),
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
    } on DioError catch (e) {
      final GetFeedOfFeedRoomResponseEntity responseEntity =
          GetFeedOfFeedRoomResponseEntity(
        success: false,
        errorMessage: e.toString(),
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
    } on DioError catch (e) {
      final GetTopicsResponseEntity response = GetTopicsResponseEntity(
        success: false,
        errorMessage: e.toString(),
        topics: [],
      );
      return response;
    }
  }

  Future<GetUserFeedResponseEntity> getUserFeed(
      GetUserFeedRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserFeedEndPoint(request.userId),
            queryParameters: request.toJson(),
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final GetUserFeedResponseEntity responseEntity =
          GetUserFeedResponseEntity.fromJson(response.data);
      return responseEntity;
    } on DioError catch (e) {
      final GetUserFeedResponseEntity response = GetUserFeedResponseEntity(
        success: false,
        errorMessage: e.toString(),
      );
      return response;
    }
  }
}
