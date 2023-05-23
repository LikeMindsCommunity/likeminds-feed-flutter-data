import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/models/auth/member_state_response_model.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class AccessService {
  final ApiClient apiClient;

  AccessService({required this.apiClient});

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<MemberStateResponseEntity> getMemberState() async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.memberStateEndpoint,
            options: Options(
              headers: {
                'x-api-key': '${apiClient.getApiKey}',
              },
            ),
          );

      final memberStateResponseEntity =
          MemberStateResponseEntity.fromJson(response.data);

      return memberStateResponseEntity;
    } on DioError catch (e) {
      debugPrint("Error from get member state access: $e");
      return MemberStateResponseEntity(
          success: false, errorMessage: e.toString());
    }
  }
}
