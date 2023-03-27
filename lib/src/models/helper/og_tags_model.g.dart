// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'og_tags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OgTagsEntity _$OgTagsEntityFromJson(Map<String, dynamic> json) => OgTagsEntity(
      description: json['description'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$OgTagsEntityToJson(OgTagsEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'title': instance.title,
      'url': instance.url,
    };
