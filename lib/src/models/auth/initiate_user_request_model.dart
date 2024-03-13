class InitiateUserRequest {
  final String? userName;
  final String? uuid;
  final bool? isGuest;
  final String? imageUrl;
  final String? apiKey;

  InitiateUserRequest._({
    this.userName,
    this.uuid,
    this.isGuest,
    this.imageUrl,
    this.apiKey,
  });

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'uuid': uuid,
        'is_guest': isGuest,
        'image_url': imageUrl,
        'api_key': apiKey,
      };
}

class InitiateUserRequestBuilder {
  String? _userName;
  String? _uuid;
  bool? _isGuest;
  String? _imageUrl;
  String? _apiKey;

  InitiateUserRequestBuilder();

  void userName(String userName) {
    _userName = userName;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  void isGuest(bool isGuest) {
    _isGuest = isGuest;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  InitiateUserRequest build() {
    return InitiateUserRequest._(
      apiKey: _apiKey,
      imageUrl: _imageUrl,
      isGuest: _isGuest,
      uuid: _uuid,
      userName: _userName,
    );
  }
}
