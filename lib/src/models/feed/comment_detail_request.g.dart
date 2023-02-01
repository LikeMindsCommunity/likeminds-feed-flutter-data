// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDetailRequest _$CommentDetailRequestFromJson(
        Map<String, dynamic> json) =>
    CommentDetailRequest(
      commentId: json['commentId'] as String,
      page: json['page'] as int,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$CommentDetailRequestToJson(
        CommentDetailRequest instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'postId': instance.postId,
      'page': instance.page,
    };
