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
      reply: CommentEntity.fromJson(
        json['data']['comment'] ?? {},
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userTopics: (json['data']['user_topics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$AddCommentReplyResponseEntityToJson(
        AddCommentReplyResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'comment': instance.reply?.toJson(),
        'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
        'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
        'user_topics': instance.userTopics,
        'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      }
    };
