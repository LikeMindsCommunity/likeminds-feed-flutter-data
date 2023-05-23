import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;
  FeedService({required this.apiClient});
  // final String authHost = "https://betaauth.likeminds.community/feed/";

  Future<UniversalFeedResponseEntity?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints
                .getUniversalFeedEndPoint(universalFeedRequest.page),
            queryParameters: {
              'page': universalFeedRequest.page,
              'page_size': universalFeedRequest.pageSize,
            },
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return UniversalFeedResponseEntity.fromJson(response.data['data']);
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
        chatrooms: null,
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
            queryParameters: {
              'page': feedRoomRequest.page,
              'feedroom_id': feedRoomRequest.feedroomId,
              'page_size': feedRoomRequest.pageSize,
            },
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
      );
      return responseEntity;
    }
  }
}
