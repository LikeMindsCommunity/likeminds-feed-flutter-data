import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/sdk/sdk_client_info_model.dart';

part 'user_tag_model.g.dart';

class UserTag {
  final String? name;
  final String? imageUrl;
  final String? customTitle;
  final int? id;
  final bool? isGuest;
  final String? uuid;
  final SDKClientInfo? sdkClientInfo;

  UserTag({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.uuid,
    this.sdkClientInfo,
  });

  factory UserTag.fromEntity(UserTagEntity entity) {
    return UserTag(
      name: entity.name,
      imageUrl: entity.imageUrl,
      customTitle: entity.customTitle,
      id: entity.id,
      isGuest: entity.isGuest,
      uuid: entity.uuid,
      sdkClientInfo: entity.sdkClientInfo,
    );
  }

  UserTagEntity toEntity() {
    return UserTagEntity(
      name: name,
      imageUrl: imageUrl,
      customTitle: customTitle,
      id: id,
      isGuest: isGuest,
      uuid: uuid,
      sdkClientInfo: sdkClientInfo,
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

  @JsonKey(name: 'uuid')
  final String? uuid;

  @JsonKey(name: 'sdk_client_info')
  final SDKClientInfo? sdkClientInfo;

  UserTagEntity({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.uuid,
    this.sdkClientInfo,
  });

  factory UserTagEntity.fromJson(Map<String, dynamic> json) =>
      _$UserTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserTagEntityToJson(this);
}
