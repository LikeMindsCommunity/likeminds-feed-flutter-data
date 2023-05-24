import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/notifications/register_device_request_model.dart';
import 'package:likeminds_feed/src/models/notifications/register_device_response_model.dart';
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
    } on DioError catch (e) {
      return RegisterDeviceResponse(
        errorMessage: e.message,
        success: false,
      );
    }
  }
}
