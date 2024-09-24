import 'package:likeminds_feed/likeminds_feed.dart';

/// Represents the response received when fetching blocked users.
class GetBlockedUsersResponse {
  /// List of blocked users.
  final List<User> blockedUsers;

  /// Constructs a [GetBlockedUsersResponse] instance.
  GetBlockedUsersResponse({required this.blockedUsers});

  /// Converts this response to an entity.
  GetBlockedUsersResponseEntity toEntity() {
    return GetBlockedUsersResponseEntity(
      blockedUsers: blockedUsers.map((user) => user.toEntity()).toList(),
    );
  }

  /// Creates a [GetBlockedUsersResponse] from an entity.
  factory GetBlockedUsersResponse.fromEntity(
      GetBlockedUsersResponseEntity entity) {
    return GetBlockedUsersResponse(
      blockedUsers: entity.blockedUsers
          .map((userEntity) => User.fromEntity(userEntity))
          .toList(),
    );
  }
}

/// Represents the entity for the response received when fetching blocked users.
class GetBlockedUsersResponseEntity {
  /// List of blocked user entities.
  final List<UserEntity> blockedUsers;

  /// Constructs a [GetBlockedUsersResponseEntity] instance.
  GetBlockedUsersResponseEntity({required this.blockedUsers});

  /// Creates a [GetBlockedUsersResponseEntity] from a response.
  factory GetBlockedUsersResponseEntity.fromResponse(
      GetBlockedUsersResponse response) {
    return GetBlockedUsersResponseEntity(
      blockedUsers: response.blockedUsers.map((e) => e.toEntity()).toList(),
    );
  }

  /// Converts this entity to JSON.
  Map<String, dynamic> toJson() {
    return {
      'blocked_users':
          blockedUsers.map((userEntity) => userEntity.toJson()).toList(),
    };
  }

  /// Creates a [GetBlockedUsersResponseEntity] from JSON.
  factory GetBlockedUsersResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetBlockedUsersResponseEntity(
      blockedUsers: (json['data']['blocked_users'] as List<dynamic>? ?? [])
          .map((userJson) =>
              UserEntity.fromJson(userJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
