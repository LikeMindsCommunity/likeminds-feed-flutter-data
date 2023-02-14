// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTagEntity _$UserTagEntityFromJson(Map<String, dynamic> json) =>
    UserTagEntity(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      customTitle: json['customTitle'] as String?,
      id: json['id'] as int?,
      isGuest: json['isGuest'] as bool?,
      userUniqueId: json['userUniqueId'] as String?,
    );

Map<String, dynamic> _$UserTagEntityToJson(UserTagEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'customTitle': instance.customTitle,
      'id': instance.id,
      'isGuest': instance.isGuest,
      'userUniqueId': instance.userUniqueId,
    };
