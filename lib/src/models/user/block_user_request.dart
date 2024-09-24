/// {@template block_user_request}
/// A request model for blocking a user.
///
/// This class is used to create a request to block a user based
/// on a unique user identifier (UUID).
/// {@endtemplate}
class BlockUserRequest {
  /// The unique user identifier (UUID).
  final String blockUserUUID;

  /// Indicates whether the user should be blocked.
  final bool shouldBlock;

  /// Creates a new instance of [BlockUserRequest].
  ///
  /// The [blockUserUUID] and [shouldBlock] parameters are required
  /// and must not be null.
  BlockUserRequest._({required this.blockUserUUID, required this.shouldBlock});

  /// Converts the request model into a JSON map for the API call.
  ///
  /// Returns a map containing the UUID and the block status.
  Map<String, dynamic> toJson() {
    return {
      'should_block': shouldBlock,
    };
  }

  /// A builder for [BlockUserRequest].
  static BlockUserRequestBuilder builder() {
    return BlockUserRequestBuilder();
  }
}

/// A builder class for [BlockUserRequest].
class BlockUserRequestBuilder {
  String? _blockUserUUID;
  bool? _shouldBlock;

  /// Sets the UUID for the request.
  BlockUserRequestBuilder blockUserUUID(String uuid) {
    _blockUserUUID = uuid;
    return this;
  }

  /// Sets the block status for the request.
  BlockUserRequestBuilder shouldBlock(bool block) {
    _shouldBlock = block;
    return this;
  }

  /// Builds and returns an instance of [BlockUserRequest].
  BlockUserRequest build() {
    if (_blockUserUUID == null) {
      throw ArgumentError('UUID must not be null');
    }
    if (_shouldBlock == null) {
      throw ArgumentError('Block status must not be null');
    }
    return BlockUserRequest._(
        blockUserUUID: _blockUserUUID!, shouldBlock: _shouldBlock!);
  }
}
