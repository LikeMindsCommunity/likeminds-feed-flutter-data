class ConnectionMetaRequest {
  final String userUUID;

  ConnectionMetaRequest._({required this.userUUID});
}

class ConnectionMetaRequestBuilder {
  String? _userUUID;

  void userUUID(String userUUID) {
    _userUUID = userUUID;
  }

  void build() {
    if (_userUUID == null) {
      throw ArgumentError.notNull('userUUID');
    }

    ConnectionMetaRequest._(userUUID: _userUUID!);
  }
}
