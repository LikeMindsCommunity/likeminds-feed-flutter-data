// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_like_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleLikeCommentResponseEntity _$ToggleLikeCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ToggleLikeCommentResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$ToggleLikeCommentResponseEntityToJson(
        ToggleLikeCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
