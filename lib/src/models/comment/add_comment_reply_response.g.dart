// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reply_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReplyResponseEntity _$AddCommentReplyResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddCommentReplyResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$AddCommentReplyResponseEntityToJson(
        AddCommentReplyResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
