class LogoutRequest {
  final String? deviceId;

  LogoutRequest._({
    this.deviceId,
  });
}

class LogoutRequestBuilder {
  String? _deviceId;

  LogoutRequestBuilder();

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  LogoutRequest build() {
    return LogoutRequest._(
      deviceId: _deviceId,
    );
  }
}
