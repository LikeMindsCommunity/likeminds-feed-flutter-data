class UpdateTokenRequest {
  final String accessToken;
  final String refreshToken;

  UpdateTokenRequest._({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}

class UpdateTokenRequestBuilder {
  String? _accessToken;
  String? _refreshToken;

  void accessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  UpdateTokenRequest build() {
    return UpdateTokenRequest._(
      accessToken: _accessToken!,
      refreshToken: _refreshToken!,
    );
  }
}
