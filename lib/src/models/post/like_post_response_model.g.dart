// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikePostResponseEntity _$LikePostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    LikePostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$LikePostResponseEntityToJson(
        LikePostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
