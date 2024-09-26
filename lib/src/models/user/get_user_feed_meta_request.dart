class GetUserFeedMetaRequest {
  final String uuid;
  GetUserFeedMetaRequest._({
    required this.uuid,
  });
}

class GetUserFeedMetaRequestBuilder {
  String? _uuid;

  GetUserFeedMetaRequestBuilder();

  void uuid(String uuid) {
    _uuid = uuid;
  }

  GetUserFeedMetaRequest build() {
    if (_uuid == null) throw Exception("uuid is required");

    return GetUserFeedMetaRequest._(
      uuid: _uuid!,
    );
  }
}
