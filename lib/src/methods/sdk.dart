import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/branding_repository.dart';
import 'package:likeminds_feed/src/repositories/media_repository.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';

import 'package:get_it/get_it.dart';
import 'package:likeminds_feed/src/di/di_service.dart';

class SdkApplication {
  SdkApplication();

  AuthApi getAuthApi() {
    return AuthApi(
      authRepository: GetIt.instance.get<AuthRepository>(
        instanceName: DIService.kInstanceAuthRepository,
      ),
    );
  }

  AccessApi getAccessApi() {
    return AccessApi(
      accessRepository: GetIt.instance.get<AccessRepository>(
        instanceName: DIService.kInstanceAccessRepository,
      ),
    );
  }

  FeedApi getFeedApi() {
    return FeedApi(
      feedRepository: GetIt.instance.get<FeedRepository>(
        instanceName: DIService.kInstanceFeedRepository,
      ),
    );
  }

  PostApi getPostApi() {
    return PostApi(
      postRepository: GetIt.instance.get<PostRepository>(
        instanceName: DIService.kInstancePostRepository,
      ),
    );
  }

  MediaApi getMediaApi() {
    return MediaApi(
      mediaRepository: GetIt.instance.get<MediaRepository>(
        instanceName: DIService.kInstanceMediaRepository,
      ),
    );
  }

  BrandingApi getBrandingApi() {
    return BrandingApi(
      brandingRepository: GetIt.instance.get<BrandingRepository>(
        instanceName: DIService.kInstanceBrandingRepository,
      ),
    );
  }
}
