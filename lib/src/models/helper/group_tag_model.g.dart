// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupTagEntity _$GroupTagEntityFromJson(Map<String, dynamic> json) =>
    GroupTagEntity(
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      route: json['route'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$GroupTagEntityToJson(GroupTagEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'route': instance.route,
      'tag': instance.tag,
      'image_url': instance.imageUrl,
    };
