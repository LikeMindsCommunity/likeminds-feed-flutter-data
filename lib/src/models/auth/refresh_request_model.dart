class RefreshAccessTokenRequest {
  final String refreshToken;

  RefreshAccessTokenRequest._({
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
        'refresh_token': refreshToken,
      };
}

class RefreshRequestBuilder {
  String? _refreshToken;

  RefreshRequestBuilder();

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  RefreshAccessTokenRequest build() {
    return RefreshAccessTokenRequest._(
      refreshToken: _refreshToken!,
    );
  }
}
