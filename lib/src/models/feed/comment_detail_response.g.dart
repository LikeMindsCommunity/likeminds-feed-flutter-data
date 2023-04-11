// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDetailResponseEntity _$CommentDetailResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CommentDetailResponseEntity(
      postReplies: CommentRepliesEntity.fromJson(
          json['comment'] as Map<String, dynamic>),
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CommentDetailResponseEntityToJson(
        CommentDetailResponseEntity instance) =>
    <String, dynamic>{
      'comment': instance.postReplies.toJson(),
      'users': instance.users.map((k, e) => MapEntry(k, e.toJson())),
    };
