import 'package:likeminds_feed/src/methods/methods.dart';
import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/branding_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';
import 'package:likeminds_feed/src/repositories/media_repository.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';
import 'package:likeminds_feed/src/services/branding_service.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';
import 'package:likeminds_feed/src/services/media_service.dart';
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

  late final bool production;
  set _setProduction(bool isProduction) => production = isProduction;
  get isProduction => instance.production;

  DIService._();

  /// Init function to register all the dependencies
  /// This function should be called before using any of the methods
  void init(String apiKey, bool isProduction, LMSdkCallback sdkCallback) {
    _setProduction = isProduction;

    ApiClient apiClient = ApiClient(
      apiKey: apiKey,
      isProduction: isProduction,
    );

    AuthService authService = AuthService(apiClient: apiClient);
    AuthRepository authRepository = AuthRepository(authService: authService);

    AccessService accessService = AccessService(apiClient: apiClient);
    AccessRepository accessRepository =
        AccessRepository(accessService: accessService);

    BrandingService brandingService = BrandingService(apiClient: apiClient);
    BrandingRepository brandingRepository =
        BrandingRepository(brandingService: brandingService);

    CommentService commentService = CommentService(apiClient: apiClient);
    FeedService feedService = FeedService(apiClient: apiClient);
    FeedRepository feedRepository = FeedRepository(
        feedService: feedService, commentService: commentService);

    PostService postService = PostService(apiClient: apiClient);
    PostRepository postRepository = PostRepository(postService: postService);

    MediaService mediaService = MediaService(apiClient: apiClient);
    MediaRepository mediaRepository =
        MediaRepository(mediaService: mediaService);

    // Register all the dependencies in the getIt instance
    getIt.registerFactory<ApiClient>(
      () => apiClient,
      instanceName: kInstanceAPIClient,
    );
    getIt.registerFactory<AccessRepository>(
      () => accessRepository,
      instanceName: kInstanceAccessRepository,
    );
    getIt.registerFactory<BrandingRepository>(
      () => brandingRepository,
      instanceName: kInstanceBrandingRepository,
    );
    getIt.registerFactory<FeedRepository>(
      () => feedRepository,
      instanceName: kInstanceFeedRepository,
    );
    getIt.registerFactory<AuthRepository>(
      () => authRepository,
      instanceName: kInstanceAuthRepository,
    );
    getIt.registerFactory<PostRepository>(
      () => postRepository,
      instanceName: kInstancePostRepository,
    );
    getIt.registerFactory<MediaRepository>(
      () => mediaRepository,
      instanceName: kInstanceMediaRepository,
    );

    // Register all the services in the getIt instance
    getIt.registerLazySingleton(
      () => NotificationService(apiClient: apiClient),
    );
    getIt.registerLazySingleton(
      () => sdkCallback,
      instanceName: "LMCallback",
    );
  }

  // Get the static instance of GetIt to get the dependencies
  static GetIt getIt = GetIt.instance;

  // Constant instances of the dependencies
  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceAccessRepository = 'access_repository';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstancePostRepository = 'post_repository';
  static const String kInstanceMediaRepository = 'media_repository';
  static const String kInstanceBrandingRepository = 'branding_repository';
}
