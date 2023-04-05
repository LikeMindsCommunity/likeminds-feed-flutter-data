import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/di/di_service.dart';

class LogoutRequest {
  final String? refreshToken;
  final String? deviceId;
  final LMSdkCallback callback = DIService.getIt.get<LMSdkCallback>(
    instanceName: "LMCallback",
  );

  LogoutRequest._({
    this.refreshToken,
    this.deviceId,
  });
}

class LogoutRequestBuilder {
  String? _refreshToken;
  String? _deviceId;

  LogoutRequestBuilder();

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  LogoutRequest build() {
    return LogoutRequest._(
      deviceId: _deviceId,
      refreshToken: _refreshToken,
    );
  }
}
