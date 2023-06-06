// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePostResponseEntity _$SavePostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SavePostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$SavePostResponseEntityToJson(
        SavePostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
