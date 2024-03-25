// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decode_url_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecodeUrlResponseEntity _$DecodeUrlResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DecodeUrlResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      ogTags: json['data']['og_tags'] == null
          ? null
          : OgTagsEntity.fromJson(
              json['data']['og_tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DecodeUrlResponseEntityToJson(
        DecodeUrlResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'og_tags': instance.ogTags?.toJson(),
      }
    };
