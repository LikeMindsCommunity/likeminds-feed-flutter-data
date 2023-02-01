// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reply_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReplyRequest _$AddCommentReplyRequestFromJson(
        Map<String, dynamic> json) =>
    AddCommentReplyRequest(
      text: json['text'] as String,
      postId: json['postId'] as String,
      commentId: json['commentId'] as String,
    );

Map<String, dynamic> _$AddCommentReplyRequestToJson(
        AddCommentReplyRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
      'postId': instance.postId,
      'commentId': instance.commentId,
    };
