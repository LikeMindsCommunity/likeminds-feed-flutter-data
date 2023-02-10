import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/endpoints.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;
  FeedService({required this.apiClient});
  // final String authHost = "https://betaauth.likeminds.community/feed/";

  Future<UniversalFeedResponseEntity?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    print(apiClient.getEndpoints
        .getUniversalFeedEndPoint(universalFeedRequest.page));
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
    } catch (e) {}
  }

  Future<GetFeedRoomResponseEntity> getFeedRoom(
      GetFeedRoomRequest getFeedRoomRequest) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.feedroomEndpoint,
            queryParameters: {
              'page': getFeedRoomRequest.page,
              'feedroom_id': getFeedRoomRequest.feedroomId,
            },
            options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      return GetFeedRoomResponseEntity.fromJson(response.data);
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
