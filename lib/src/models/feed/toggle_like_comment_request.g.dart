// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_like_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleLikeCommentRequest _$ToggleLikeCommentRequestFromJson(
        Map<String, dynamic> json) =>
    ToggleLikeCommentRequest(
      postId: json['postId'] as String,
      commentId: json['commentId'] as String,
    );

Map<String, dynamic> _$ToggleLikeCommentRequestToJson(
        ToggleLikeCommentRequest instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentId': instance.commentId,
    };
