// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentResponseEntity _$AddCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddCommentResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      reply: Comment.fromEntity(
        commentEntity: CommentEntity.fromJson(
          json['data']['comment'] as Map<String, dynamic>,
        ),
      ),
    );

Map<String, dynamic> _$AddCommentResponseEntityToJson(
        AddCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'comment': instance.reply?.toEntity(),
      },
    };
