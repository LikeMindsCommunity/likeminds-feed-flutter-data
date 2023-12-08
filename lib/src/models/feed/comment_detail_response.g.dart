// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentResponseEntity _$GetCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetCommentResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      postReplies: CommentEntity.fromJson(
          json['data']['comment'] as Map<String, dynamic>),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetCommentResponseEntityToJson(
        GetCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'comment': instance.postReplies?.toJson(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
    };
