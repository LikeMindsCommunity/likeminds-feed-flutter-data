class ConnectionMetaRequest {
  final String userUUID;

  ConnectionMetaRequest._({required this.userUUID});
}

class ConnectionMetaRequestBuilder {
  String? _userUUID;

  void userUUID(String userUUID) {
    _userUUID = userUUID;
  }

  ConnectionMetaRequest build() {
    if (_userUUID == null) {
      throw ArgumentError.notNull('userUUID');
    }

    return ConnectionMetaRequest._(userUUID: _userUUID!);
  }
}
