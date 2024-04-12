// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditCommentResponseEntity _$EditCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditCommentResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      reply: CommentEntity.fromJson(
        json['data']['comment'] ?? {},
      ),
    );

Map<String, dynamic> _$EditCommentResponseEntityToJson(
        EditCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'comment': instance.reply?.toJson(),
      },
    };
