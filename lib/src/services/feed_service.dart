import 'package:dio/dio.dart';
import 'package:feed_sdk/feed_sdk.dart';
import 'package:feed_sdk/src/endpoints.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/feedroom/get_feed_feedroom_request_model.dart';
import 'package:feed_sdk/src/models/feedroom/get_feed_feedroom_response_model.dart';
import 'package:feed_sdk/src/models/feedroom/get_feedroom_request_model.dart';
import 'package:feed_sdk/src/models/feedroom/get_feedroom_response_model.dart';
import 'package:feed_sdk/src/models/post/post_model.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;
  FeedService({required this.apiClient});
  // final String authHost = "https://betaauth.likeminds.community/feed/";

  Future<UniversalFeedResponseEntity?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    print(apiClient.getUniversalFeedEndPoint(universalFeedRequest.page));
    try {
      final response = await apiClient.client().get(
            apiClient.getUniversalFeedEndPoint(universalFeedRequest.page),
            // data: universalFeedRequest.toJson(),
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
            FEEDROOM_ENDPOINT,
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
            "${KETTLE_HOST}/feed/group",
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
              success: false, errorMessage: e.toString(), posts: [], users: {});
      return responseEntity;
    }
  }
}
