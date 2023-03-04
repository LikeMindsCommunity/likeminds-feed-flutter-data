import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class AccessService {
  final ApiClient apiClient;

  AccessService({required this.apiClient});

  /// Get access for a particular post access type
  /// [accessType] - The access type to check for
  /// Returns true if the user has access, false otherwise
  Future<bool> getAccess(String accessType) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.accessEndpoint,
            queryParameters: {
              'access_type': accessType,
            },
            options: Options(
              headers: {
                'x-member-id': '${apiClient.getUserId}',
                'x-api-key': '${apiClient.getApiKey}',
              },
            ),
          );
      print("Response from access check: ${response.data}");
      if (response.data['access'] == true && response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print("Error from get post: $e");
      return false;
    }
  }

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<bool> getMemberState() async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.memberStateEndpoint,
            options: Options(
              headers: {
                'x-api-key': '${apiClient.getApiKey}',
              },
            ),
          );
      print("Response from access check: ${response.data}");
      if (response.data['data']['state'] == 1 &&
          response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print("Error from get member state access: $e");
      return false;
    }
  }
}
