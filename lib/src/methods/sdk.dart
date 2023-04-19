import 'package:likeminds_feed/src/methods/helper.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/methods/moderation.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';
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

  HelperApi getHelperApi() {
    return HelperApi(
      helperRepository: GetIt.instance.get<HelperRepository>(
        instanceName: DIService.kInstanceHelperRepository,
      ),
    );
  }

  ModerationApi getModerationApi() {
    return ModerationApi(
      moderationRepository: GetIt.instance.get<ModerationRepository>(
        instanceName: DIService.kInstanceModerationRepository,
      ),
    );
  }
}
