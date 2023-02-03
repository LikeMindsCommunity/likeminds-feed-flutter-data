// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/methods/access.dart';
import 'package:likeminds_feed/src/methods/media.dart';
import 'package:likeminds_feed/src/methods/post.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/media_repository.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:get_it/get_it.dart';

import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/auth.dart';
import 'package:likeminds_feed/src/methods/feed.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';

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

  AccessApi getAccessApi() {
    return AccessApi(
        accessRepository: GetIt.instance.get<AccessRepository>(
            instanceName: DIService.kInstanceAccessRepository));
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
