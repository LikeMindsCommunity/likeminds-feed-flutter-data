/// {@template get_blocked_users_request}
/// A request model for fetching blocked users.
///
/// This class is used to create a request to fetch blocked users based
/// on a unique user identifier (UUID).
class GetBlockedUsersRequest {
  /// The unique user identifier (UUID).
  final String uuid;

  /// Creates a new instance of [GetBlockedUsersRequest].
  ///
  /// The [uuid] parameter is required and must not be null.
  GetBlockedUsersRequest._({required this.uuid});

  /// Converts the request model into a JSON map for the API call.
  ///
  /// Returns a map containing the UUID.
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
    };
  }

  /// A builder for [GetBlockedUsersRequest].
  static GetBlockedUsersRequestBuilder builder() {
    return GetBlockedUsersRequestBuilder();
  }
}

/// A builder class for [GetBlockedUsersRequest].
class GetBlockedUsersRequestBuilder {
  String? _uuid;

  /// Sets the UUID for the request.
  GetBlockedUsersRequestBuilder uuid(String uuid) {
    _uuid = uuid;
    return this;
  }

  /// Builds and returns an instance of [GetBlockedUsersRequest].
  GetBlockedUsersRequest build() {
    if (_uuid == null) {
      throw ArgumentError('UUID must not be null');
    }
    return GetBlockedUsersRequest._(uuid: _uuid!);
  }
}
