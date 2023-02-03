import 'package:json_annotation/json_annotation.dart';

part 'refresh_request_model.g.dart';

class RefreshRequest {
  final String refreshToken;

  RefreshRequest({required this.refreshToken});

  factory RefreshRequest.fromEntity({required RefreshRequestEntity entity}) =>
      RefreshRequest(
        refreshToken: entity.refreshToken,
      );

  RefreshRequestEntity toEntity() => RefreshRequestEntity(
        refreshToken: refreshToken,
      );
}

@JsonSerializable()
class RefreshRequestEntity {
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  RefreshRequestEntity({required this.refreshToken});

  factory RefreshRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshRequestEntityToJson(this);
}
