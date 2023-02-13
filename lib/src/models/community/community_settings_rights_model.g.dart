// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_settings_rights_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunitySettingsRightsEntity _$CommunitySettingsRightsEntityFromJson(
        Map<String, dynamic> json) =>
    CommunitySettingsRightsEntity(
      id: json['id'] as int,
      state: json['state'] as int,
      title: json['title'] as String,
      subtitle: json['sub_title'] as String?,
      isLocked: json['is_locked'] as bool,
      isSelected: json['is_selected'] as bool,
    );

Map<String, dynamic> _$CommunitySettingsRightsEntityToJson(
        CommunitySettingsRightsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'title': instance.title,
      'sub_title': instance.subtitle,
      'is_locked': instance.isLocked,
      'is_selected': instance.isSelected,
    };
