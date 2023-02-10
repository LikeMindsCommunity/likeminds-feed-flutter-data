import 'package:likeminds_feed/src/repositories/access_repository.dart';
import 'package:likeminds_feed/src/repositories/auth_repository.dart';
import 'package:likeminds_feed/src/repositories/feed_repository.dart';
import 'package:likeminds_feed/src/repositories/media_repository.dart';
import 'package:likeminds_feed/src/repositories/post_repository.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';
import 'package:likeminds_feed/src/services/comment_service.dart';
import 'package:likeminds_feed/src/services/feed_service.dart';
import 'package:likeminds_feed/src/services/media_service.dart';
import 'package:likeminds_feed/src/services/notification_service.dart';
import 'package:likeminds_feed/src/services/post_service.dart';
import 'package:get_it/get_it.dart';

class DIService {
  static DIService? _instance;
  static DIService get instance => _instance ??= DIService._();

  DIService._() {}
  init(String apiKey, bool isProduction) {
    ApiClient _apiClient =
        ApiClient(apiKey: apiKey, isProduction: isProduction);

    AuthService _authService = AuthService(apiClient: _apiClient);
    AuthRepository _authRepository = AuthRepository(authService: _authService);

    AccessService _accessService = AccessService(apiClient: _apiClient);
    AccessRepository _accessRepository =
        AccessRepository(accessService: _accessService);

    CommentService _commentService = CommentService(apiClient: _apiClient);
    FeedService _feedService = FeedService(apiClient: _apiClient);
    FeedRepository _feedRepository = FeedRepository(
        feedService: _feedService, commentService: _commentService);

    PostService _postService = PostService(apiClient: _apiClient);
    PostRepository _postRepository = PostRepository(postService: _postService);

    MediaService _mediaService = MediaService(apiClient: _apiClient);
    MediaRepository _mediaRepository =
        MediaRepository(mediaService: _mediaService);

    // getIt.registerFactory<CommentService>(() => _commentService);
    getIt.registerFactory<ApiClient>(() => _apiClient,
        instanceName: kInstanceAPIClient);
    getIt.registerFactory<AccessRepository>(
      () => _accessRepository,
      instanceName: kInstanceAccessRepository,
    );
    getIt.registerFactory<FeedRepository>(() => _feedRepository,
        instanceName: kInstanceFeedRepository);
    getIt.registerFactory<AuthRepository>(() => _authRepository,
        instanceName: kInstanceAuthRepository);
    getIt.registerFactory<PostRepository>(() => _postRepository,
        instanceName: kInstancePostRepository);
    getIt.registerFactory<MediaRepository>(() => _mediaRepository,
        instanceName: kInstanceMediaRepository);

    getIt.registerLazySingleton(
        () => NotificationService(apiClient: _apiClient));
  }
  // DIService();

  static GetIt getIt = GetIt.instance;

  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceAccessRepository = 'access_repository';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
  static const String kInstancePostRepository = 'post_repository';
  static const String kInstanceMediaRepository = 'media_repository';
}
