// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseEntity _$AddPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String,
    );

Map<String, dynamic> _$AddPostResponseEntityToJson(
        AddPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
