// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_configurations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityConfigurationsEntity _$CommunityConfigurationsEntityFromJson(
        Map<String, dynamic> json) =>
    CommunityConfigurationsEntity(
      description: json['description'] as String?,
      type: json['type'] as String?,
      value: (json['value'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e),
      ),
    );

Map<String, dynamic> _$CommunityConfigurationsEntityToJson(
        CommunityConfigurationsEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': instance.type,
      'value': instance.value,
    };
