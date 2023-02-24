import 'package:json_annotation/json_annotation.dart';

part 'user_tag_model.g.dart';

class UserTag {
  final String? name;
  final String? imageUrl;
  final String? customTitle;
  final int? id;
  final bool? isGuest;
  final String? userUniqueId;

  UserTag({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.userUniqueId,
  });

  factory UserTag.fromEntity(UserTagEntity entity) {
    return UserTag(
      name: entity.name,
      imageUrl: entity.imageUrl,
      customTitle: entity.customTitle,
      id: entity.id,
      isGuest: entity.isGuest,
      userUniqueId: entity.userUniqueId,
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

  UserTagEntity({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.userUniqueId,
  });

  factory UserTagEntity.fromJson(Map<String, dynamic> json) =>
      _$UserTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserTagEntityToJson(this);
}
