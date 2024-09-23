// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/constants/string_constants.dart';
import 'package:likeminds_feed/src/methods/persistence.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

/// Auth service to talk to our backend.
/// Performs all the auth related tasks
/// like initiate user, refresh user, logout user
/// requires [ApiClient] to talk to backend
class AuthService {
  final ApiClient apiClient;

  AuthService({required this.apiClient});

  Future<LMResponse<void>> updateTokens(LMAuthToken request) async {
    await apiClient.updateTokens(request.accessToken, request.refreshToken);
    return LMResponse(success: true);
  }

  /// Initiate user
  /// Initiates a SDK user, and logs in the user if app access is granted
  /// Also updates tokens and sets user id and community id
  /// Returns [InitiateUserResponseEntity] if success
  /// Takes [InitiateUserRequest] as input
  /// Throws [DioException] if error
  Future<InitiateUserResponseEntity> initiateUser(
    InitiateUserRequest initiateUserRequest,
  ) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.authEndpoint,
            data: initiateUserRequest.toJson(),
            options: Options(
              headers: {
                'x-api-key': initiateUserRequest.apiKey,
              },
            ),
          );

      InitiateUserResponseEntity initiateUserResponse =
          InitiateUserResponseEntity.fromJson(response.data);

      // Checking if API returned success
      if (initiateUserResponse.success) {
        // Checking if API returned app access
        if (initiateUserResponse.appAccess!) {
          // If API returned app access, then set tokens and return response
          await apiClient.updateTokens(
            initiateUserResponse.accessToken!,
            initiateUserResponse.refreshToken!,
          );
          final localPref = LMFeedPersistence.instance;
          await localPref.insertOrUpdateValueInCache((LMCacheBuilder()
                ..key(kApiKey)
                ..value(initiateUserRequest.apiKey))
              .build());
          await localPref.deleteUserDB();
          await localPref
              .insertOrUpdateUser(User.fromEntity(initiateUserResponse.user!));
          return initiateUserResponse;
          // Else, if API returned no app access
        } else {
          // If API returned no app access, then logout and return response
          final response = await logout(null);
          return InitiateUserResponseEntity(
            success: false,
            logoutResponse: response,
          );
        }
        // Else, if API returned error message
      } else {
        return initiateUserResponse;
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return InitiateUserResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  Future<ValidateUserResponseEntity> validateUser(
      ValidateUserRequest request) async {
    try {
      // setting tokens in api client
      // before making the request
      // to handle the case where the tokens
      // are not set in the api client
      await apiClient.updateTokens(
        request.accessToken,
        request.refreshToken,
      );
      final response = await apiClient.client().get(
            apiClient.getEndpoints.authEndpoint,
            options: Options(
              headers: {
                'Authorization': request.accessToken,
              },
            ),
          );

      ValidateUserResponseEntity validateUserResponse =
          ValidateUserResponseEntity.fromJson(response.data);

      // Checking if API returned success
      if (validateUserResponse.success) {
        // Checking if API returned app access
        if (validateUserResponse.appAccess!) {
          // If API returned app access, then set tokens and return response
          final localPref = LMFeedPersistence.instance;
          await localPref.deleteUserDB();
          await localPref
              .insertOrUpdateUser(User.fromEntity(validateUserResponse.user!));
          return validateUserResponse;
          // Else, if API returned no app access
        } else {
          // If API returned no app access, then logout and return response
          await logout(null);

          return validateUserResponse;
        }
        // Else, if API returned error message
      } else {
        return validateUserResponse;
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return ValidateUserResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  /// Refresh user
  /// Refreshes a SDK user, and updates tokens
  /// Returns [RefreshResponseEntity] if success
  /// Takes [RefreshAccessTokenRequest] as input
  /// Throws [DioException] if error
  Future<RefreshResponseEntity> refreshAccessToken(
      RefreshAccessTokenRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.authRefreshEndpoint,
            options: Options(
              headers: {
                'Authorization': request.refreshToken,
              },
            ),
          );
      RefreshResponseEntity refreshResponse =
          RefreshResponseEntity.fromJson(response.data);

      return refreshResponse;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return RefreshResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  /// Logout user
  /// Logs out a SDK user, and clears tokens
  /// Returns [LogoutResponseEntity] if success
  /// Takes [LogoutRequest] as input
  /// Throws [DioException] if error
  Future<LogoutResponseEntity> logout(LogoutRequest? request) async {
    try {
      final response = await apiClient.client().post(
        apiClient.getEndpoints.authLogoutEndpoint,
        data: {
          "refresh_token": request!.refreshToken ?? apiClient.getRefreshToken
        },
      );

      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(response.data);
      request.callback?.logoutCallback();
      apiClient.clearTokens();

      PersistenceApi persistenceApi =
          SDKApplication.instance.getPersistenceApi();

      persistenceApi.clearCache();
      persistenceApi.clearCommunityConfigurationDB();
      persistenceApi.deleteUserDB();
      persistenceApi.deleteMemberState();

      return logoutResponse;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LogoutResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
