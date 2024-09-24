import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

/// The `IUserService` interface defines the contract for user-related services.
/// It includes methods for fetching user feed metadata,
/// retrieving blocked users, and toggling the block status of a user.
abstract class IUserService {
  /// {@template userService_getUserFeedMeta}
  /// Fetches the metadata for a user's feed.
  ///
  /// Takes a [GetUserFeedMetaRequest] object as input and
  /// returns a [GetUserFeedMetaResponseEntity].
  /// Throws a [DioException] if there is an error during the API call.
  /// {@endtemplate}
  Future<GetUserFeedMetaResponseEntity> getUserFeedMeta(
      GetUserFeedMetaRequest request);

  /// {@template userService_getBlockedUsers}
  /// Retrieves the list of blocked users.
  ///
  /// Takes a [GetBlockedUsersRequest] object as input and
  /// returns an [LMResponse] containing  a [GetBlockedUsersResponseEntity]
  /// if successful, or an error message if not.
  /// Throws a [DioException] if there is an error during the API call.
  /// {@endtemplate}
  Future<LMResponse<GetBlockedUsersResponseEntity>> getBlockedUsers(
      GetBlockedUsersRequest request);

  /// {@template userService_toggleUser}
  /// Toggles the block status of a user.
  ///
  /// Takes a [BlockUserRequest] object as input and
  /// returns an [LMResponse] containing void if successful,
  /// or an error message if not.
  /// Throws a [DioException] if there is an error during the API call.
  /// {@endtemplate}
  Future<LMResponse<void>> toggleUser(BlockUserRequest request);
}

/// The `UserService` class implements the `IUserService` interface and provides
/// concrete implementations for the methods defined in the interface.
class UserService implements IUserService {
  final ApiClient apiClient;

  /// Constructs a [UserService] with the given [ApiClient].
  UserService({required this.apiClient});

  @override
  Future<GetUserFeedMetaResponseEntity> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserFeedMetaEndPoint(request.uuid),
          );

      return GetUserFeedMetaResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetUserFeedMetaResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<GetBlockedUsersResponseEntity>> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.blockUserEndpoint(request.userUUID),
          );
      if (response.data != null && response.data['success'] == true) {
        return LMResponse.success(
            data:
                GetBlockedUsersResponseEntity.fromJson(response.data['data']));
      } else {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
    } on DioException catch (e, stacktrace) {
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<void>> toggleUser(BlockUserRequest request) async {
    try {
      final response = await apiClient.client().put(
          apiClient.getEndpoints.blockUserEndpoint(request.blockUserUUID),
          data: request.toJson());
      if (response.data != null && response.data['success'] == true) {
        return LMResponse.success(data: null);
      } else {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
    } on DioException catch (e, stacktrace) {
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
