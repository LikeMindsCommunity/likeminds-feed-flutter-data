// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPostResponseEntity _$EditPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$EditPostResponseEntityToJson(
        EditPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
