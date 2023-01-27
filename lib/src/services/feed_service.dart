import 'package:dio/dio.dart';
import 'package:feed_sdk/feed_sdk.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/feed/post.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

class FeedService {
  final ApiClient apiClient;
  FeedService({required this.apiClient}) {}
  final Dio _dio = Dio();
  // final String authHost = "https://betaauth.likeminds.community/feed/";

  Future<UniversalFeedResponseEntity?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    print(apiClient.getUniversalFeedEndPoint(universalFeedRequest.page));
    try {
      final response = await _dio.get(
        apiClient.getUniversalFeedEndPoint(universalFeedRequest.page),
        // data: universalFeedRequest.toJson(),
        options: Options(
          headers: {'Authorization': '${apiClient.accessToken}'},
        ),
      );
      print(response.data);
      return UniversalFeedResponseEntity.fromJson(response.data['data']);
    } on DioError catch (e) {
      print(e.toString() + "dsa");
    } catch (e) {
      print(e);
    }
    // return UniversalFeedResponseEntity(posts: [], users: {});
  }
}
