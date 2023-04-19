class RegisterDeviceRequest {
  final String token;
  final String deviceId;
  final int memberId;

  RegisterDeviceRequest._({
    required this.token,
    required this.deviceId,
    required this.memberId,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'deviceId': deviceId,
        'memberId': memberId,
      };
}

class RegisterDeviceRequestBuilder {
  String? _token;
  String? _deviceId;
  int? _memberId;

  RegisterDeviceRequestBuilder();

  void token(String token) {
    _token = token;
  }

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  void memberId(int memberId) {
    _memberId = memberId;
  }

  RegisterDeviceRequest build() {
    return RegisterDeviceRequest._(
      token: _token!,
      deviceId: _deviceId!,
      memberId: _memberId!,
    );
  }
}
