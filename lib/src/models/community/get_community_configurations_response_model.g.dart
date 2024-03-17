// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_community_configurations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommunityConfigurationsResponseEntity
    _$GetCommunityConfigurationsResponseEntityFromJson(
            Map<String, dynamic> json) =>
        GetCommunityConfigurationsResponseEntity(
          success: json['success'] as bool,
          errorMessage: json['error_message'] as String?,
          communityConfigurations:
              (json['data']['community_configurations'] as List<dynamic>?)
                  ?.map((e) => CommunityConfigurationsEntity.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$GetCommunityConfigurationsResponseEntityToJson(
        GetCommunityConfigurationsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'community_configurations':
            instance.communityConfigurations?.map((e) => e.toJson()).toList(),
      }
    };
