class GetProfileRequest {
  String userUniqueId;

  GetProfileRequest._({required this.userUniqueId});

  Map<String, dynamic> toJson() => {
        "uuid": userUniqueId,
      };
}

class GetProfileRequestBuilder {
  String? _userUniqueId;

  void userUniqueId(String userUniqueId) {
    _userUniqueId = userUniqueId;
  }

  GetProfileRequest build() {
    return GetProfileRequest._(
      userUniqueId: _userUniqueId!,
    );
  }
}
