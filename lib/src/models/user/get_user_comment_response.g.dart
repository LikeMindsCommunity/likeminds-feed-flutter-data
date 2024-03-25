// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserCommentsResponseEntity _$GetUserCommentsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetUserCommentsResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      comments: (json['data']?['comments'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']?['users'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>))),
      posts: (json['data']?['posts'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>))),
      topics: (json['data']?['topics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>))),
      widgets: (json['data']?['widgets'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>))),
      userTopics: (json['data']?['user_topics'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List<dynamic>).map((e) => e as String).toList())),
    );

Map<String, dynamic> _$GetUserCommentsResponseEntityToJson(
        GetUserCommentsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      "data": {
        'comments': instance.comments?.map((e) => e.toJson()).toList(),
        'users':
            instance.users?.map((key, value) => MapEntry(key, value.toJson())),
        'posts':
            instance.posts?.map((key, value) => MapEntry(key, value.toJson())),
        'topics':
            instance.topics?.map((key, value) => MapEntry(key, value.toJson())),
        'widgets': instance.widgets
            ?.map((key, value) => MapEntry(key, value.toJson())),
        'user_topics': instance.userTopics
      }
    };
