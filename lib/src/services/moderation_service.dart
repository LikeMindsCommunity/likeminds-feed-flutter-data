import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
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
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetDeleteReasonResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
