// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandingResponseEntity _$BrandingResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BrandingResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      branding: json['branding'] == null
          ? null
          : BrandingEntity.fromJson(json['branding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrandingResponseEntityToJson(
        BrandingResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'branding': instance.branding?.toJson(),
    };
