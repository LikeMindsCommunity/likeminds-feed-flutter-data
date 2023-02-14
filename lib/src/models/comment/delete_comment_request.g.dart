// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentRequestEntity _$DeleteCommentRequestEntityFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentRequestEntity(
      commentId: json['comment_id'] as String,
      postId: json['post_id'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$DeleteCommentRequestEntityToJson(
        DeleteCommentRequestEntity instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'post_id': instance.postId,
      'reason': instance.reason,
    };
