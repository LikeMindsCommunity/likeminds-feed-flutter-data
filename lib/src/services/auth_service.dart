// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_response_model.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

class AuthService {
  final String apiKey;
  final ApiClient apiClient;
  AuthService({required this.apiKey, required this.apiClient});

  final String authHost = "https://betaauth.likeminds.community/sdk/initiate";

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    try {
      final response = await apiClient.client().post(
            authHost,
            data: initiateUserRequest.toJson(),
            options: Options(
              headers: {
                'x-api-key': apiKey,
              },
            ),
          );

      InitiateUserResponse initiateUserResponse =
          InitiateUserResponse.fromJson(response.data);
      apiClient.initTokens(initiateUserResponse.data?['access_token'],
          initiateUserResponse.data?['refresh_token']);
      return initiateUserResponse;
    } on DioError catch (e) {
      InitiateUserResponse initiateUserResponse =
          InitiateUserResponse.fromJson(e.response?.data);
      return initiateUserResponse;
    }
    return InitiateUserResponse(success: false);
    // final String? apiKey = initiateUserRequest.apiKey;
  }
}
