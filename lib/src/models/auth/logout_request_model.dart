import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/di/di_service.dart';

class LogoutRequest {
  final String? refreshToken;
  final String? deviceId;
  final LMSdkCallback callback = DIService.getIt.get<LMSdkCallback>(
    instanceName: "LMCallback",
  );

  LogoutRequest({
    this.refreshToken,
    this.deviceId,
  });
}
