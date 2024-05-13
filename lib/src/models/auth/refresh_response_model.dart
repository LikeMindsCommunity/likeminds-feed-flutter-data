import 'package:json_annotation/json_annotation.dart';

part 'refresh_response_model.g.dart';

class RefreshAccessTokenResponse {
  final bool success;
  final String? errorMessage;
  final String? accessToken;
  final String? refreshToken;

  RefreshAccessTokenResponse({
    required this.success,
    this.errorMessage,
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshAccessTokenResponse.fromEntity(
          {required RefreshResponseEntity entity}) =>
      RefreshAccessTokenResponse(
        success: entity.success,
        errorMessage: entity.errorMessage,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  RefreshResponseEntity toEntity() => RefreshResponseEntity(
        success: success,
        errorMessage: errorMessage,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

@JsonSerializable()
class RefreshResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  RefreshResponseEntity({
    required this.success,
    this.errorMessage,
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshResponseEntityToJson(this);
}
