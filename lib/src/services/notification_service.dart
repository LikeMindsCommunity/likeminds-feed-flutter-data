import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class INotificationService {
  Future<RegisterDeviceResponse> registerDevice(RegisterDeviceRequest request);
}

class NotificationService implements INotificationService {
  final ApiClient apiClient;

  NotificationService({required this.apiClient});

  @override
  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.registerDeviceEndpoint,
            data: {
              'token': request.token,
            },
            options: Options(
              headers: {
                'x-member-id': '${request.memberId}',
                'x-api-key': apiClient.getApiKey,
                'x-device-id': request.deviceId,
              },
            ),
          );
      final entity = RegisterDeviceResponseEntity.fromJson(response.data);
      return RegisterDeviceResponse.fromEntity(entity);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return RegisterDeviceResponse.fromEntity(RegisterDeviceResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      ));
    }
  }
}
