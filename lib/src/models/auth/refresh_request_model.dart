class RefreshRequest {
  final String refreshToken;

  RefreshRequest._({
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

  RefreshRequest build() {
    return RefreshRequest._(
      refreshToken: _refreshToken!,
    );
  }
}
