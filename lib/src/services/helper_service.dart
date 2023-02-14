import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class HelperService {
  final ApiClient apiClient;

  HelperService({required this.apiClient});

  Future<TagResponseModelEntity> getTags({int? feedroomId}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.tagsEndpoint,
        options: Options(
          headers: {
            'x-api-key': '${apiClient.getApiKey}',
          },
        ),
        queryParameters: {
          'feedroom_id': feedroomId,
        },
      );
      print("Response from get tags: ${response.data}");
      if (response.data['success'] == true) {
        return TagResponseModelEntity.fromJson(response.data);
      } else {
        return TagResponseModelEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      print("Error from get tags: $e");
      return TagResponseModelEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
