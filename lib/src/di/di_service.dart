import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/comment_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';
import 'package:likeminds_feed/src/repositories/helper_repository.dart';
import 'package:likeminds_feed/src/repositories/moderation_repository.dart';
import 'package:likeminds_feed/src/repositories/notification_feed_repository.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';
import 'package:likeminds_feed/src/services/helper_service.dart';
import 'package:likeminds_feed/src/services/moderation_service.dart';
import 'package:likeminds_feed/src/services/notification_feed_service.dart';
import 'package:likeminds_feed/src/services/notification_service.dart';
import 'package:likeminds_feed/src/services/post_service.dart';
import 'package:get_it/get_it.dart';

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

    FeedService feedService = FeedService(apiClient: apiClient);
    FeedRepository feedRepository = FeedRepository(feedService: feedService);

    PostService postService = PostService(apiClient: apiClient);
    PostRepository postRepository = PostRepository(postService: postService);

    ModerationService moderationService =
        ModerationService(apiClient: apiClient);
    ModerationRepository moderationRepository =
        ModerationRepository(moderationService: moderationService);

    NotificationFeedService notificationFeedService =
        NotificationFeedService(apiClient: apiClient);
    NotificationFeedRepository notificationFeedRepository =
        NotificationFeedRepository(
            notificationFeedService: notificationFeedService);

    // Register all the dependencies in the getIt instance
    getIt.registerFactory<ApiClient>(
      () => apiClient,
      instanceName: kInstanceAPIClient,
    );
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
  }

  // Get the static instance of GetIt to get the dependencies
  static GetIt getIt = GetIt.instance;

  // Constant instances of the dependencies
  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceAccessRepository = 'access_repository';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceCommentRepository = 'comment_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstancePostRepository = 'post_repository';
  static const String kInstanceMediaRepository = 'media_repository';
  static const String kInstanceHelperRepository = 'helper_repository';
  static const String kInstanceModerationRepository = 'moderation_repository';
  static const String kInstanceNotificationFeedRepository =
      'notification_feed_repository';
}
