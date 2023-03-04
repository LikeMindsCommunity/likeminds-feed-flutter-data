// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePostResponseEntity _$DeletePostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DeletePostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$DeletePostResponseEntityToJson(
        DeletePostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
