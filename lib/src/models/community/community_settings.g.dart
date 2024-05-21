// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunitySettingsEntity _$CommunitySettingsEntityFromJson(
        Map<String, dynamic> json) =>
    CommunitySettingsEntity(
      enabled: json['enabled'] as bool,
      enabledBy: json['enabled_by'] as int,
      settingSubTitle: json['setting_sub_title'] as String,
      settingTitle: json['setting_title'] as String,
      settingType: json['setting_type'] as String,
    );

Map<String, dynamic> _$CommunitySettingsEntityToJson(
        CommunitySettingsEntity instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enabled_by': instance.enabledBy,
      'setting_sub_title': instance.settingSubTitle,
      'setting_title': instance.settingTitle,
      'setting_type': instance.settingType,
    };
