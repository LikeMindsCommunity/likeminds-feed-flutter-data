import 'package:get_it/get_it.dart';
import 'package:likeminds_feed/src/models/notifications/register_device_request_model.dart';
import 'package:likeminds_feed/src/models/notifications/register_device_response_model.dart';
import 'package:likeminds_feed/src/services/notification_service.dart';

class LMNotifications {
  LMNotifications._();

  static LMNotifications? _instance;
  static LMNotifications get instance => _instance ??= LMNotifications._();

  static final NotificationService _notifService =
      GetIt.instance<NotificationService>();

  static Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    return await _notifService.registerDevice(request);
  }
}
