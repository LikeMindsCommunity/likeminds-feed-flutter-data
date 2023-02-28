// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagResponseModelEntity _$TagResponseModelEntityFromJson(
        Map<String, dynamic> json) =>
    TagResponseModelEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      groupTags: (json['data']['group_tags'] as List<dynamic>?)
          ?.map((e) => GroupTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['data']['community_members'] as List<dynamic>?)
          ?.map((e) => UserTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagResponseModelEntityToJson(
        TagResponseModelEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'group_tags': instance.groupTags,
      'community_members': instance.members,
    };
