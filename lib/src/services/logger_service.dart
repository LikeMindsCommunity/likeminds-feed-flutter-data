import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:likeminds_feed/src/models/logger/push_log_request.dart';
import 'package:likeminds_feed/src/models/logger/push_log_response.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class LoggerService {
  final ApiClient apiClient;

  LoggerService({required this.apiClient});

  Future<PushLogResponseEntity> pushLogs(
      {required PushLogRequest request}) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.tagsEndpoint,
            options: Options(
              headers: {
                'x-api-key': apiClient.getApiKey,
              },
            ),
            data: request.toJson(),
          );
      if (response.data['success'] == true) {
        return PushLogResponseEntity.fromJson(response.data);
      } else {
        return PushLogResponseEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioException catch (e) {
      debugPrint("Error from push logs: $e");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return PushLogResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
