import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
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
      print(response.data);
      return PostDetailResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString() + "dsa");
      return PostDetailResponseEntity(
          success: false,
          errorMessage: "An error occured, please try again later");
    } catch (e) {
      print(e);
      return PostDetailResponseEntity(
          success: false,
          errorMessage: "An error occured, please try again later");
    }
  }

  Future<GetFeedResponseEntity?> getUniversalFeed(
      GetFeedRequest universalFeedRequest) async {
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
      return GetFeedResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString() + "dsa");
    } catch (e) {
      print(e);
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
