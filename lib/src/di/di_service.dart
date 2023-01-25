import 'package:feed_sdk/src/repositories/auth_repository.dart';
import 'package:feed_sdk/src/repositories/feed_repository.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';
import 'package:feed_sdk/src/services/auth_service.dart';
import 'package:feed_sdk/src/services/feed_service.dart';
import 'package:get_it/get_it.dart';

class DIService {
  static DIService? _instance;
  static DIService get instance => _instance ??= DIService._();

  DIService._() {}
  init(String apiKey) {
    ApiClient _apiClient = ApiClient();
    AuthService _authService =
        AuthService(apiKey: apiKey, apiClient: _apiClient);
    AuthRepository _authRepository = AuthRepository(authService: _authService);

    FeedService _feedService = FeedService(apiClient: _apiClient);
    FeedRepository _feedRepository = FeedRepository(feedService: _feedService);

    getIt.registerFactory<ApiClient>(() => _apiClient,
        instanceName: kInstanceAPIClient);
    getIt.registerFactory<FeedRepository>(() => _feedRepository,
        instanceName: kInstanceFeedRepository);
    getIt.registerFactory<AuthRepository>(() => _authRepository,
        instanceName: kInstanceAuthRepository);
  }
  // DIService();

  static GetIt getIt = GetIt.instance;

  static const String kInstanceAPIClient = 'api_client';
  static const String kInstanceFeedRepository = 'feed_repository';
  static const String kInstanceAuthRepository = 'auth_repository';
}
