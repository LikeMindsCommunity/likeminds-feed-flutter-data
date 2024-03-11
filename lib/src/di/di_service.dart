import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/comment_repository.dart';
import 'package:likeminds_feed/src/repositories/community_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';
import 'package:likeminds_feed/src/repositories/logger_repository.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';
import 'package:likeminds_feed/src/repositories/activity.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/repositories/user_repository.dart';
import 'package:likeminds_feed/src/repositories/widget_repository.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';
import 'package:likeminds_feed/src/services/community_service.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';
import 'package:likeminds_feed/src/services/helper_service.dart';
import 'package:likeminds_feed/src/services/logger_service.dart';
import 'package:likeminds_feed/src/services/moderation_service.dart';
import 'package:likeminds_feed/src/services/activity_service.dart';
import 'package:likeminds_feed/src/services/notification_service.dart';
import 'package:likeminds_feed/src/services/post_service.dart';
import 'package:get_it/get_it.dart';
import 'package:likeminds_feed/src/services/user_service.dart';
import 'package:likeminds_feed/src/services/widgets_service.dart';

/// Dependency Injection Service
/// This class is responsible for registering all the dependencies
/// and providing the instances of the dependencies
/// This class is a singleton class
class DIService {
  static DIService? _instance;

  static DIService get instance => _instance ??= DIService._();

  DIService._();

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(String apiKey, bool isProduction, LMSDKCallback? sdkCallback) {
    ApiClient apiClient = ApiClient(
      apiKey: apiKey,
      isProduction: isProduction,
    );

    // Register all the services in the getIt instance
    getIt.registerLazySingleton(
      () => NotificationService(apiClient: apiClient),
    );
    if (sdkCallback != null) {
      getIt.registerLazySingleton(
        () => sdkCallback,
        instanceName: "LMCallback",
      );
    }

    AuthService authService = AuthService(apiClient: apiClient);
    AuthRepository authRepository = AuthRepository(authService: authService);

    HelperService helperService = HelperService(apiClient: apiClient);
    HelperRepository helperRepository =
        HelperRepository(helperService: helperService);

    AccessService accessService = AccessService(apiClient: apiClient);
    AccessRepository accessRepository =
        AccessRepository(accessService: accessService);

    CommentService commentService = CommentService(apiClient: apiClient);
    CommentRepository commentRepository =
        CommentRepository(commentService: commentService);

    CommunityService communityService = CommunityService(apiClient: apiClient);
    CommunityRepository communityRepository =
        CommunityRepository(communityService: communityService);

    FeedService feedService = FeedService(apiClient: apiClient);
    FeedRepository feedRepository = FeedRepository(feedService: feedService);

    PostService postService = PostService(apiClient: apiClient);
    PostRepository postRepository = PostRepository(postService: postService);

    WidgetsService widgetsService = WidgetsService(apiClient: apiClient);
    WidgetRepository widgetRepository =
        WidgetRepository(widgetsService: widgetsService);

    ModerationService moderationService =
        ModerationService(apiClient: apiClient);
    ModerationRepository moderationRepository =
        ModerationRepository(moderationService: moderationService);

    NotificationFeedService notificationFeedService =
        NotificationFeedService(apiClient: apiClient);
    NotificationFeedRepository notificationFeedRepository =
        NotificationFeedRepository(
            notificationFeedService: notificationFeedService);

    LoggerService loggerService = LoggerService(apiClient: apiClient);
    LoggerRepository loggerRepository =
        LoggerRepository(loggerService: loggerService);

    UserService userService = UserService(apiClient: apiClient);
    UserRepository userRepository = UserRepository(userService: userService);

    // Register all the dependencies in the getIt instance
    getIt.registerFactory<ApiClient>(() => apiClient,
        instanceName: kInstanceAPIClient);
    getIt.registerFactory<AccessRepository>(
      () => accessRepository,
      instanceName: kInstanceAccessRepository,
    );
    getIt.registerFactory<HelperRepository>(
      () => helperRepository,
      instanceName: kInstanceHelperRepository,
    );
    getIt.registerFactory<FeedRepository>(
      () => feedRepository,
      instanceName: kInstanceFeedRepository,
    );
    getIt.registerFactory<CommentRepository>(
      () => commentRepository,
      instanceName: kInstanceCommentRepository,
    );
    getIt.registerFactory<CommunityRepository>(
      () => communityRepository,
      instanceName: kInstanceCommunityRepository,
    );
    getIt.registerFactory<AuthRepository>(
      () => authRepository,
      instanceName: kInstanceAuthRepository,
    );
    getIt.registerFactory<PostRepository>(
      () => postRepository,
      instanceName: kInstancePostRepository,
    );
    getIt.registerFactory<ModerationRepository>(
      () => moderationRepository,
      instanceName: kInstanceModerationRepository,
    );
    getIt.registerFactory<NotificationFeedRepository>(
      () => notificationFeedRepository,
      instanceName: kInstanceNotificationFeedRepository,
    );
    getIt.registerFactory<WidgetRepository>(
      () => widgetRepository,
      instanceName: kInstanceWidgetRepository,
    );
    getIt.registerFactory<LoggerRepository>(
      () => loggerRepository,
      instanceName: kInstanceLoggerRepository,
    );
    getIt.registerFactory<UserRepository>(
      () => userRepository,
      instanceName: kInstanceUserRepository,
    );
  }

  // Get the static instance of GetIt to get the dependencies
  static GetIt getIt = GetIt.instance;

  // Constant instances of the dependencies
  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceAccessRepository = 'access_repository';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceCommentRepository = 'comment_repository';
  static const String kInstanceCommunityRepository = 'community_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstancePostRepository = 'post_repository';
  static const String kInstanceMediaRepository = 'media_repository';
  static const String kInstanceHelperRepository = 'helper_repository';
  static const String kInstanceModerationRepository = 'moderation_repository';
  static const String kInstanceNotificationFeedRepository =
      'notification_feed_repository';
  static const String kInstanceWidgetRepository = 'widget_repository';
  static const String kInstanceLoggerRepository = 'logger_repository';
  static const String kInstanceUserRepository = 'user_repository';
}
