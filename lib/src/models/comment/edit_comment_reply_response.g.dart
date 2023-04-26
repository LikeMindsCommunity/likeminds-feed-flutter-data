// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_comment_reply_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditCommentReplyResponseEntity _$EditCommentReplyResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditCommentReplyResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      reply: CommentReply.fromEntity(
        CommentReplyEntity.fromJson(
          json['data']['comment'] ?? {},
        ),
      ),
    );

Map<String, dynamic> _$EditCommentReplyResponseEntityToJson(
        EditCommentReplyResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'comment': instance.reply,
    };
