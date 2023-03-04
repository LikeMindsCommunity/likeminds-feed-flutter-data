// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

/// Auth service to talk to our backend.
/// Performs all the auth related tasks
/// like initiate user, refresh user, logout user
/// requires [ApiClient] to talk to backend
class AuthService {
  final ApiClient apiClient;
  AuthService({required this.apiClient});

  /// Initiate user
  /// Initiates a SDK user, and logs in the user if app access is granted
  /// Also updates tokens and sets user id and community id
  /// Returns [InitiateUserResponseEntity] if success
  /// Takes [InitiateUserRequest] as input
  /// Throws [DioError] if error
  Future<InitiateUserResponseEntity> initiateUser(
    InitiateUserRequest initiateUserRequest,
  ) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.authEndpoint,
            data: initiateUserRequest.toJson(),
            options: Options(
              headers: {
                'x-api-key': apiClient.getApiKey,
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
          apiClient.initTokens(
            initiateUserResponse.accessToken!,
            initiateUserResponse.refreshToken!,
          );
          final initiateUser = initiateUserResponse.initiateUser!;
          apiClient.setUserId = initiateUser.user.id;
          apiClient.setCommunityId = initiateUser.community.id;
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
    } on DioError catch (e) {
      InitiateUserResponseEntity initiateUserResponse =
          InitiateUserResponseEntity.fromJson(e.response?.data);
      return initiateUserResponse;
    }
  }

  /// Refresh user
  /// Refreshes a SDK user, and updates tokens
  /// Returns [RefreshResponseEntity] if success
  /// Takes [RefreshRequest] as input
  /// Throws [DioError] if error
  Future<RefreshResponseEntity> refresh(RefreshRequest request) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
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
    } on DioError catch (e) {
      RefreshResponseEntity refreshResponse =
          RefreshResponseEntity.fromJson(e.response?.data);
      return refreshResponse;
    }
  }

  /// Logout user
  /// Logs out a SDK user, and clears tokens
  /// Returns [LogoutResponseEntity] if success
  /// Takes [LogoutRequest] as input
  /// Throws [DioError] if error
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
      request.callback.logoutCallback();
      apiClient.clearTokens();
      return logoutResponse;
    } on DioError catch (e) {
      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(e.response?.data);
      return logoutResponse;
    }
  }
}
