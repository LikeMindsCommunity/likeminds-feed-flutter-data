import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class ModerationService {
  final ApiClient apiClient;

  ModerationService({required this.apiClient});

  Future<GetDeleteReasonResponseEntity> getDeleteReasons(
      GetDeleteReasonRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.endPoints.reportEndpoint,
            queryParameters: request.toJson(),
          );
      return GetDeleteReasonResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return GetDeleteReasonResponseEntity(
        errorMessage: e.message,
        success: false,
      );
    }
  }
}
