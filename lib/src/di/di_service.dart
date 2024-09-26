import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/comment_repository.dart';
import 'package:likeminds_feed/src/repositories/community_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';
import 'package:likeminds_feed/src/repositories/logger_repository.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';
import 'package:likeminds_feed/src/repositories/activity.dart';
import 'package:likeminds_feed/src/repositories/persistence_repository.dart';
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
import 'package:likeminds_feed/src/services/persistence_service.dart';
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

  /// Provides a singleton instance of the `DIService` class.
  ///
  /// If the instance is not already created, it initializes a new instance
  /// using the private constructor `DIService._()`.
  ///
  /// Returns:
  ///   A singleton instance of the `DIService` class.
  static DIService get instance => _instance ??= DIService._();

  DIService._();

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(bool isProduction, LMSDKCallback? sdkCallback) {
    ApiClient apiClient = ApiClient(
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

    PersistenceService persistenceService = PersistenceService();
    PersistenceRepository persistenceRepository =
        PersistenceRepository(persistenceService: persistenceService);

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
    getIt.registerFactory<PersistenceRepository>(() => persistenceRepository,
        instanceName: kInstancePersistenceRepository);

    getIt.registerFactory<UserRepository>(
      () => userRepository,
      instanceName: kInstanceUserRepository,
    );
  }

  /// This class provides a static instance of GetIt for dependency injection.
  ///
  /// It also defines constant instances of various dependencies used throughout
  /// the application. These constants are used as keys to register and retrieve
  /// dependencies from the GetIt instance.
  static GetIt getIt = GetIt.instance;

  /// - `kInstanceAPIClient`: Key for the API client instance.
  static const String kInstanceAPIClient = 'api_client';

  /// - `kInstanceAccessRepository`: Key for the access repository instance.
  static const String kInstanceAccessRepository = 'access_repository';

  /// - `kInstanceFeedRepository`: Key for the feed repository instance.
  static const String kInstanceFeedRepository = 'feed_repository';

  /// - `kInstanceCommentRepository`: Key for the comment repository instance.
  static const String kInstanceCommentRepository = 'comment_repository';

  /// - `kInstanceCommunityRepository`: Key f
  /// or the community repository instance.
  static const String kInstanceCommunityRepository = 'community_repository';

  /// - `kInstanceAuthRepository`: Key for the auth repository instance.
  static const String kInstanceAuthRepository = 'auth_repository';

  /// - `kInstancePostRepository`: Key for the post repository instance.
  static const String kInstancePostRepository = 'post_repository';

  /// - `kInstanceMediaRepository`: Key for the media repository instance.
  static const String kInstanceMediaRepository = 'media_repository';

  /// - `kInstanceHelperRepository`: Key for the helper repository instance.
  static const String kInstanceHelperRepository = 'helper_repository';

  /// - `kInstancePersistenceRepository`: Key for the
  /// persistence repository instance.
  static const String kInstancePersistenceRepository = 'persistence_repository';

  /// - `kInstanceModerationRepository`: Key for the
  /// moderation repository instance.
  static const String kInstanceModerationRepository = 'moderation_repository';

  /// - `kInstanceNotificationFeedRepository`: Key for the
  /// notification feed repository instance.
  static const String kInstanceNotificationFeedRepository =
      'notification_feed_repository';

  /// - `kInstanceWidgetRepository`: Key for the widget repository instance.
  static const String kInstanceWidgetRepository = 'widget_repository';

  /// - `kInstanceLoggerRepository`: Key for the logger repository instance.
  static const String kInstanceLoggerRepository = 'logger_repository';

  /// - `kInstanceUserRepository`: Key for the user repository instance.
  static const String kInstanceUserRepository = 'user_repository';
}
