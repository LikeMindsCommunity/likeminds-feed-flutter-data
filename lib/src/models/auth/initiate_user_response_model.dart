import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'initiate_user_response_model.g.dart';

class InitiateUserResponse {
  final bool success;
  final bool? appAccess;
  final InitiateUser? initiateUser;
  final LogoutResponse? logoutResponse;
  final String? accessToken;
  final String? refreshToken;
  final String? errorMessage;

  InitiateUserResponse({
    required this.success,
    this.appAccess,
    this.initiateUser,
    this.logoutResponse,
    this.accessToken,
    this.refreshToken,
    this.errorMessage,
  });

  factory InitiateUserResponse.fromEntity(InitiateUserResponseEntity entity) {
    return InitiateUserResponse(
      success: entity.success,
      appAccess: entity.appAccess,
      initiateUser: entity.initiateUser != null
          ? InitiateUser.fromEntity(entity.initiateUser!)
          : null,
      logoutResponse: entity.logoutResponse != null
          ? LogoutResponse.fromEntity(entity.logoutResponse!)
          : null,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      errorMessage: entity.errorMessage,
    );
  }

  toEntity() {
    return InitiateUserResponseEntity(
      success: success,
      appAccess: appAccess,
      initiateUser: initiateUser?.toEntity(),
      logoutResponse: logoutResponse?.toEntity(),
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

  @JsonKey(name: 'initiate_user')
  final InitiateUserEntity? initiateUser;

  @JsonKey(name: 'logout_response')
  final LogoutResponseEntity? logoutResponse;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  InitiateUserResponseEntity({
    required this.success,
    this.appAccess,
    this.initiateUser,
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
