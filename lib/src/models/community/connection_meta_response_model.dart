import 'package:json_annotation/json_annotation.dart';

part 'connection_meta_response_model.g.dart';

class ConnectionMetaResponse {
  bool followStatus;
  int followersCount;
  int followingsCount;

  ConnectionMetaResponse({
    required this.followStatus,
    required this.followersCount,
    required this.followingsCount,
  });

  factory ConnectionMetaResponse.fromEntity(
      ConnectionMetaResponseEntity entity) {
    return ConnectionMetaResponse(
      followStatus: entity.followStatus,
      followersCount: entity.followersCount,
      followingsCount: entity.followingsCount,
    );
  }

  ConnectionMetaResponseEntity toEntity() {
    return ConnectionMetaResponseEntity(
      followStatus: followStatus,
      followersCount: followersCount,
      followingsCount: followingsCount,
    );
  }
}

@JsonSerializable()
class ConnectionMetaResponseEntity {
  @JsonKey(name: 'follow_status')
  bool followStatus;
  @JsonKey(name: 'followers_count')
  int followersCount;
  @JsonKey(name: 'followings_count')
  int followingsCount;

  ConnectionMetaResponseEntity({
    required this.followStatus,
    required this.followersCount,
    required this.followingsCount,
  });

  factory ConnectionMetaResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ConnectionMetaResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionMetaResponseEntityToJson(this);
}
