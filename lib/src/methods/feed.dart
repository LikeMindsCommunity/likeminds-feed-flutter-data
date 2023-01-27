import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/models/feed/post_detail_request.dart';
import 'package:feed_sdk/src/models/feed/post_detail_response.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_request.dart';
import 'package:feed_sdk/src/models/feed/universal_feed_response.dart';
import 'package:feed_sdk/src/repositories/auth_repository.dart';
import 'package:feed_sdk/src/repositories/feed_repository.dart';

class FeedApi {
  FeedApi({required this.feedRepository});

  final FeedRepository feedRepository;

  Future<UniversalFeedResponse?> getUniversalFeed(
      UniversalFeedRequest universalFeedRequest) async {
    final UniversalFeedResponse? universalFeedResponse =
        await feedRepository.getUniversalFeed(universalFeedRequest);
    return universalFeedResponse;
  }

  Future<PostDetailResponse?> getPost(
      PostDetailRequest postDetailRequest) async {
    final PostDetailResponse? postDetailResponse =
        await feedRepository.getPost(postDetailRequest);
    return postDetailResponse;
  }
}
