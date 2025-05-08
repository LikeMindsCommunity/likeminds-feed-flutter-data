import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'initiate_user_response_model.g.dart';

class InitiateUserResponse {
  final bool success;
  final bool? appAccess;
  final User? user;
  final Community? community;
  final LMResponse? logoutResponse;
  final String? accessToken;
  final String? refreshToken;
  final String? errorMessage;

  InitiateUserResponse({
    required this.success,
    this.appAccess,
    this.user,
    this.community,
    this.logoutResponse,
    this.accessToken,
    this.refreshToken,
    this.errorMessage,
  });

  factory InitiateUserResponse.fromEntity(InitiateUserResponseEntity entity) {
    return InitiateUserResponse(
      success: entity.success,
      appAccess: entity.appAccess,
      user: entity.user != null ? User.fromEntity(entity.user!) : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      logoutResponse: entity.logoutResponse,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      errorMessage: entity.errorMessage,
    );
  }

  InitiateUserResponseEntity toEntity() {
    return InitiateUserResponseEntity(
      success: success,
      appAccess: appAccess,
      user: user?.toEntity(),
      community: community?.toEntity(),
      logoutResponse: logoutResponse,
      accessToken: accessToken,
      refreshToken: refreshToken,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class InitiateUserResponseEntity {
  final bool success;

  @JsonKey(name: 'app_access')
  final bool? appAccess;

  @JsonKey(name: 'user')
  final UserEntity? user;

  @JsonKey(name: 'community')
  final CommunityEntity? community;

  @JsonKey(name: 'logout_response')
  final LMResponse? logoutResponse;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  InitiateUserResponseEntity({
    required this.success,
    this.appAccess,
    this.user,
    this.community,
    this.logoutResponse,
    this.accessToken,
    this.refreshToken,
    this.errorMessage,
  });

  factory InitiateUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserResponseEntityToJson(this);

  @override
  String toString() =>
      "InitiateUserResponse: {success: $success, errorMessage: $errorMessage}";
}
