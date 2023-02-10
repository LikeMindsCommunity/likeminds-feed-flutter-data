// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class AuthService {
  final ApiClient apiClient;
  AuthService({required this.apiClient});

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
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

      InitiateUserResponse initiateUserResponse =
          InitiateUserResponse.fromJson(response.data);

      apiClient.initTokens(initiateUserResponse.data?['access_token'],
          initiateUserResponse.data?['refresh_token']);
      apiClient.setUserId =
          initiateUserResponse.data?["user"]['user_unique_id'];
      apiClient.setCommunityId = initiateUserResponse.data?["community"]['id'];
      return initiateUserResponse;
    } on DioError catch (e) {
      InitiateUserResponse initiateUserResponse =
          InitiateUserResponse.fromJson(e.response?.data);
      return initiateUserResponse;
    }
  }

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

  Future<LogoutResponseEntity> logout(LogoutRequest request) async {
    try {
      final response = await apiClient.client().post(
        apiClient.getEndpoints.authLogoutEndpoint,
        data: {
          "refresh_token": request.refreshToken ?? apiClient.getRefreshToken
        },
      );
      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(response.data);

      return logoutResponse;
    } on DioError catch (e) {
      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(e.response?.data);
      return logoutResponse;
    }
  }
}
