class GetProfileRequest {
  String uuid;

  GetProfileRequest._({required this.uuid});

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
      };
}

class GetProfileRequestBuilder {
  String? _uuid;

  void uuid(String uuid) {
    _uuid = uuid;
  }

  GetProfileRequest build() {
    return GetProfileRequest._(
      uuid: _uuid!,
    );
  }
}
