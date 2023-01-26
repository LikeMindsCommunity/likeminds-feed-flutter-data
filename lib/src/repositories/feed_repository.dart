import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
import 'package:feed_sdk/src/services/auth_service.dart';
import 'package:feed_sdk/src/services/feed_service.dart';

class FeedRepository {
  FeedRepository({required this.feedService});
  final FeedService feedService;

  Future<UniversalFeedResponse> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    final UniversalFeedResponseEntity responseEntity =
        await feedService.getUniversalFeed(universalFeedRequest);
    return UniversalFeedResponse.fromEntity(entity: responseEntity);
  }
}
