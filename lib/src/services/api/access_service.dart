import 'package:dio/dio.dart';
import 'package:feed_sdk/src/endpoints.dart';
import 'package:feed_sdk/src/services/api/api_client.dart';

class AccessService {
  final ApiClient apiClient;

  AccessService({required this.apiClient});

  Future<bool> getAccess(String accessType) async {
    try {
      final response = await apiClient.client().get(
            ACCESS_ENDPOINT,
            queryParameters: {
              'access_type': accessType,
            },
            options: Options(
              headers: {
                'x-member-id': '${apiClient.getUserId()}',
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
}
