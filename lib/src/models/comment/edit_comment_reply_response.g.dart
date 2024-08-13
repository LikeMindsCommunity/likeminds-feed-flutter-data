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
      reply: CommentEntity.fromJson(
        json['data']['comment'] ?? {},
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userTopics: (json['userTopics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$EditCommentReplyResponseEntityToJson(
        EditCommentReplyResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'comment': instance.reply?.toJson(),
        'users': instance.users,
        'topics': instance.topics,
        'widgets': instance.widgets,
        'userTopics': instance.userTopics,
      }
    };
