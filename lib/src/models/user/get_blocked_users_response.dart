import 'package:likeminds_feed/likeminds_feed.dart';

/// Represents the response received when fetching blocked users.
class GetBlockedUsersResponse {
  /// Indicates whether the request was successful.
  final bool success;

  /// List of blocked users.
  final List<User>? blockedUsers;

  /// Error message, if any.
  final String? errorMessage;

  /// Constructs a [GetBlockedUsersResponse] instance.
  GetBlockedUsersResponse(
      {required this.success, this.blockedUsers, this.errorMessage});

  /// Converts this response to an entity.
  GetBlockedUsersResponseEntity toEntity() {
    return GetBlockedUsersResponseEntity(
      success: success,
      blockedUsers: blockedUsers?.map((user) => user.toEntity()).toList(),
      errorMessage: errorMessage,
    );
  }

  /// Creates a [GetBlockedUsersResponse] from an entity.
  factory GetBlockedUsersResponse.fromEntity(
      GetBlockedUsersResponseEntity entity) {
    return GetBlockedUsersResponse(
      success: entity.success,
      blockedUsers: entity.blockedUsers
          ?.map((userEntity) => User.fromEntity(userEntity))
          .toList(),
      errorMessage: entity.errorMessage,
    );
  }
}

/// Represents the entity for the response received when fetching blocked users.
class GetBlockedUsersResponseEntity {
  /// Indicates whether the request was successful.
  final bool success;

  /// List of blocked user entities.
  final List<UserEntity>? blockedUsers;

  /// Error message, if any.
  final String? errorMessage;

  /// Constructs a [GetBlockedUsersResponseEntity] instance.
  GetBlockedUsersResponseEntity(
      {required this.success, this.blockedUsers, this.errorMessage});

  /// Creates a [GetBlockedUsersResponseEntity] from a response.
  factory GetBlockedUsersResponseEntity.fromResponse(
      GetBlockedUsersResponse response) {
    return GetBlockedUsersResponseEntity(
      success: response.success,
      blockedUsers: response.blockedUsers?.map((e) => e.toEntity()).toList(),
      errorMessage: response.errorMessage,
    );
  }

  /// Converts this entity to JSON.
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': {
        'blocked_users':
            blockedUsers?.map((userEntity) => userEntity.toJson()).toList(),
      },
      'error_message': errorMessage,
    };
  }

  /// Creates a [GetBlockedUsersResponseEntity] from JSON.
  factory GetBlockedUsersResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetBlockedUsersResponseEntity(
      success: json['success'],
      blockedUsers: (json['data']['blocked_users'] as List<dynamic>?)
          ?.map((userJson) =>
              UserEntity.fromJson(userJson as Map<String, dynamic>))
          .toList(),
      errorMessage: json['error_message'],
    );
  }
}
