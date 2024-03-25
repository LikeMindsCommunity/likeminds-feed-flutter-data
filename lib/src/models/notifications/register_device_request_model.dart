class RegisterDeviceRequest {
  final String token;
  final String deviceId;
  final String uuid;

  RegisterDeviceRequest._({
    required this.token,
    required this.deviceId,
    required this.uuid,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'deviceId': deviceId,
        'uuid': uuid,
      };
}

class RegisterDeviceRequestBuilder {
  String? _token;
  String? _deviceId;
  String? _uuid;

  RegisterDeviceRequestBuilder();

  void token(String token) {
    _token = token;
  }

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  RegisterDeviceRequest build() {
    return RegisterDeviceRequest._(
      token: _token!,
      deviceId: _deviceId!,
      uuid: _uuid!,
    );
  }
}
