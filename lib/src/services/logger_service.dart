import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class LoggerService {
  final ApiClient apiClient;

  LoggerService({required this.apiClient});

  Future<PushLogResponseEntity> pushLogs(
      {required PushLogRequest request}) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.loggerEndpoint,
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
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
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
