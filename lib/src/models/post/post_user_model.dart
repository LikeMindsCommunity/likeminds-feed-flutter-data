import 'package:json_annotation/json_annotation.dart';

part 'post_user_model.g.dart';

class PostUser {
  final int id;
  final String imageUrl;
  final String name;
  final String userUniqueId;
  final bool isGuest;
  final bool isDeleted;
  PostUser({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.userUniqueId,
    required this.isGuest,
    required this.isDeleted,
  });

  factory PostUser.fromEntity({required PostUserEntity entity}) {
    return PostUser(
        id: entity.id,
        imageUrl: entity.imageUrl,
        name: entity.name,
        userUniqueId: entity.userUniqueId,
        isGuest: entity.isGuest,
        isDeleted: entity.isDeleted);
  }

  PostUserEntity toEntity() {
    return PostUserEntity(
        id: id,
        imageUrl: imageUrl,
        name: name,
        userUniqueId: userUniqueId,
        isGuest: isGuest,
        isDeleted: isDeleted);
  }
}

@JsonSerializable()
class PostUserEntity {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final String name;
  @JsonKey(name: 'user_unique_id')
  final String userUniqueId;
  @JsonKey(name: 'is_guest')
  final bool isGuest;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  PostUserEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.userUniqueId,
    required this.isGuest,
    required this.isDeleted,
  });
  factory PostUserEntity.fromJson(Map<String, dynamic> data) =>
      _$PostUserEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostUserEntityToJson(this);
}
