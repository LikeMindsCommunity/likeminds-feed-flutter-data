class ValidateUserRequest {
  String accessToken;
  String refreshToken;

  ValidateUserRequest._({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}

class ValidateUserRequestBuilder {
  String? _accessToken;
  String? _refreshToken;

  void accessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  ValidateUserRequest build() {
    if (_accessToken == null) {
      throw ArgumentError.value(_accessToken, 'accessToken');
    }

    if (_refreshToken == null) {
      throw ArgumentError.value(_refreshToken, 'refreshToken');
    }

    return ValidateUserRequest._(
      accessToken: _accessToken!,
      refreshToken: _refreshToken!,
    );
  }
}
