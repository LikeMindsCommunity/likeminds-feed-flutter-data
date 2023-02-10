class LogoutRequest {
  final String? refreshToken;
  final String deviceId;

  LogoutRequest({
    this.refreshToken,
    required this.deviceId,
  });
}
