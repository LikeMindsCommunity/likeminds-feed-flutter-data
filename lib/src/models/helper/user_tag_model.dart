import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/sdk/sdk_client_info_model.dart';

part 'user_tag_model.g.dart';

class UserTag {
  final String? name;
  final String? imageUrl;
  final String? customTitle;
  final int? id;
  final bool? isGuest;
  final String? userUniqueId;
  final SDKClientInfo? sdkClientInfo;

  UserTag({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.userUniqueId,
    this.sdkClientInfo,
  });

  factory UserTag.fromEntity(UserTagEntity entity) {
    return UserTag(
      name: entity.name,
      imageUrl: entity.imageUrl,
      customTitle: entity.customTitle,
      id: entity.id,
      isGuest: entity.isGuest,
      userUniqueId: entity.userUniqueId,
      sdkClientInfo: entity.sdkClientInfoEntity != null
          ? SDKClientInfo.fromEntity(entity.sdkClientInfoEntity!)
          : null,
    );
  }

  UserTagEntity toEntity() {
    return UserTagEntity(
      name: name,
      imageUrl: imageUrl,
      customTitle: customTitle,
      id: id,
      isGuest: isGuest,
      userUniqueId: userUniqueId,
      sdkClientInfoEntity: sdkClientInfo?.toEntity(),
    );
  }

  @override
  String toString() => '$name';
}

@JsonSerializable()
class UserTagEntity {
  final int? id;
  final String? name;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'custom_title')
  final String? customTitle;

  @JsonKey(name: 'is_guest')
  final bool? isGuest;

  @JsonKey(name: 'user_unique_id')
  final String? userUniqueId;

  @JsonKey(name: 'sdk_client_info')
  final SDKClientInfoEntity? sdkClientInfoEntity;

  UserTagEntity({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.userUniqueId,
    this.sdkClientInfoEntity,
  });

  factory UserTagEntity.fromJson(Map<String, dynamic> json) =>
      _$UserTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserTagEntityToJson(this);
}
