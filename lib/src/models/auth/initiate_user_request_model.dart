class InitiateUserRequest {
  final String? userName;
  final String? userId;
  final bool? isGuest;
  final String? imageUrl;
  final String? apiKey;

  InitiateUserRequest._({
    this.userName,
    this.userId,
    this.isGuest,
    this.imageUrl,
    this.apiKey,
  });

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'uuid': userId,
        'is_guest': isGuest,
        'image_url': imageUrl,
        'api_key': apiKey,
      };
}

class InitiateUserRequestBuilder {
  String? _userName;
  String? _userId;
  bool? _isGuest;
  String? _imageUrl;
  String? _apiKey;

  InitiateUserRequestBuilder();

  void userName(String userName) {
    _userName = userName;
  }

  void userId(String userId) {
    _userId = userId;
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
      userId: _userId,
      userName: _userName,
    );
  }
}
