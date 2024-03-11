import 'package:likeminds_feed/src/methods/community.dart';
import 'package:likeminds_feed/src/methods/helper.dart';
import 'package:likeminds_feed/src/methods/logger.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/methods/moderation.dart';
import 'package:likeminds_feed/src/methods/activity.dart';
import 'package:likeminds_feed/src/methods/user.dart';
import 'package:likeminds_feed/src/methods/widgets.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/comment_repository.dart';
import 'package:likeminds_feed/src/repositories/community_repository.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';
import 'package:likeminds_feed/src/repositories/logger_repository.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';
import 'package:likeminds_feed/src/repositories/activity.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';

import 'package:get_it/get_it.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/repositories/user_repository.dart';
import 'package:likeminds_feed/src/repositories/widget_repository.dart';

class SDKApplication {
  static SDKApplication? _instance;

  static SDKApplication get instance => _instance ??= SDKApplication._();

  SDKApplication._();

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

  CommentApi getCommentApi() {
    return CommentApi(
      commentRepository: GetIt.instance.get<CommentRepository>(
        instanceName: DIService.kInstanceCommentRepository,
      ),
    );
  }

  CommunityApi getCommunityApi() {
    return CommunityApi(
      communityRepository: GetIt.instance.get<CommunityRepository>(
        instanceName: DIService.kInstanceCommunityRepository,
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

  NotificationFeedApi getNotificationFeedApi() {
    return NotificationFeedApi(
      notificationFeedRepository:
          GetIt.instance.get<NotificationFeedRepository>(
        instanceName: DIService.kInstanceNotificationFeedRepository,
      ),
    );
  }

  WidgetApi getWidgetApi() {
    return WidgetApi(
      widgetRepository: GetIt.instance.get<WidgetRepository>(
        instanceName: DIService.kInstanceWidgetRepository,
      ),
    );
  }

  LoggerApi getLoggerApi() {
    return LoggerApi(
      loggerRepository: GetIt.instance.get<LoggerRepository>(
        instanceName: DIService.kInstanceLoggerRepository,
      ),
    );
  }

  UserApi getUserApi() {
    return UserApi(
      userRepository: GetIt.instance.get<UserRepository>(
        instanceName: DIService.kInstanceUserRepository,
      ),
    );
  }
}
