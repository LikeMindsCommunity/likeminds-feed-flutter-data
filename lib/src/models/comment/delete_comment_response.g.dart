// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentResponseEntity _$DeleteCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$DeleteCommentResponseEntityToJson(
        DeleteCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
