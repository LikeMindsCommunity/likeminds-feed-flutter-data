import 'package:likeminds_feed/likeminds_feed.dart';

part 'validate_user_response_model.g.dart';

class ValidateUserResponse {
  final bool success;
  final String? errorMessage;
  final User? user;
  final Community? community;
  final bool? appAccess;

  ValidateUserResponse._({
    required this.success,
    this.errorMessage,
    this.user,
    this.community,
    this.appAccess,
  });

  factory ValidateUserResponse.fromEntity(ValidateUserResponseEntity entity) {
    return ValidateUserResponse._(
      success: entity.success,
      errorMessage: entity.errorMessage,
      user: entity.user != null ? User.fromEntity(entity.user!) : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      appAccess: entity.appAccess,
    );
  }

  ValidateUserResponseEntity toEntity() {
    return ValidateUserResponseEntity(
      success: success,
      errorMessage: errorMessage,
      user: user?.toEntity(),
      community: community?.toEntity(),
      appAccess: appAccess,
    );
  }
}

class ValidateUserResponseEntity {
  final bool success;
  final String? errorMessage;
  final UserEntity? user;
  final CommunityEntity? community;
  final bool? appAccess;

  ValidateUserResponseEntity({
    required this.success,
    this.errorMessage,
    this.user,
    this.community,
    this.appAccess,
  });

  factory ValidateUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ValidateUserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateUserResponseEntityToJson(this);
}
