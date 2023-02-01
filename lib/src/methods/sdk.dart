// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feed_sdk/src/methods/media.dart';
import 'package:feed_sdk/src/methods/post.dart';
import 'package:feed_sdk/src/repositories/auth_repository.dart';
import 'package:feed_sdk/src/repositories/media_repository.dart';
import 'package:feed_sdk/src/repositories/post_repository.dart';
import 'package:get_it/get_it.dart';

import 'package:feed_sdk/src/di/di_service.dart';
import 'package:feed_sdk/src/methods/auth.dart';
import 'package:feed_sdk/src/methods/feed.dart';
import 'package:feed_sdk/src/models/models.dart';
import 'package:feed_sdk/src/repositories/feed_repository.dart';

class SdkApplication {
  final String apiKey;
  SdkApplication({
    required this.apiKey,
  });

  AuthApi getAuthApi() {
    // return authApiImpl
    print('Getting Auth API');
    return AuthApi(
        apiKey: apiKey,
        authRepository: GetIt.instance.get<AuthRepository>(
            instanceName: DIService.kInstanceAuthRepository));
  }

  FeedApi getFeedApi() {
    return FeedApi(
        feedRepository: GetIt.instance.get<FeedRepository>(
            instanceName: DIService.kInstanceFeedRepository));
  }

  PostApi getPostApi() {
    return PostApi(
        postRepository: GetIt.instance.get<PostRepository>(
      instanceName: DIService.kInstancePostRepository,
    ));
  }

  MediaApi getMediaApi() {
    return MediaApi(
        mediaRepository: GetIt.instance.get<MediaRepository>(
      instanceName: DIService.kInstanceMediaRepository,
    ));
  }
}
