// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentResponseEntity _$AddCommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddCommentResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      reply: CommentEntity.fromJson(
        json['data']['comment'] as Map<String, dynamic>,
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
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

Map<String, dynamic> _$AddCommentResponseEntityToJson(
        AddCommentResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'reply': instance.reply,
      'users': instance.users,
      'topics': instance.topics,
      'widgets': instance.widgets,
      'userTopics': instance.userTopics,
    };
