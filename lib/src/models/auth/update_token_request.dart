class LMAuthToken {
  final String accessToken;
  final String refreshToken;

  LMAuthToken._({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}

class LMAuthTokenBuilder {
  String? _accessToken;
  String? _refreshToken;

  void accessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  LMAuthToken build() {
    return LMAuthToken._(
      accessToken: _accessToken!,
      refreshToken: _refreshToken!,
    );
  }
}
