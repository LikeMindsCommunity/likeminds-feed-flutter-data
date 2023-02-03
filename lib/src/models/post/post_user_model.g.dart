// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUserEntity _$PostUserEntityFromJson(Map<String, dynamic> json) =>
    PostUserEntity(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      userUniqueId: json['user_unique_id'] as String,
      isGuest: json['is_guest'] as bool,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$PostUserEntityToJson(PostUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'user_unique_id': instance.userUniqueId,
      'is_guest': instance.isGuest,
      'is_deleted': instance.isDeleted,
    };
