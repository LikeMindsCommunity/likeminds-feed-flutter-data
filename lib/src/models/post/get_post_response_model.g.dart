// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostResponseEntity _$GetPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      post: json['data']['post'] == null
          ? null
          : PostEntity.fromJson(json['data']['post'] as Map<String, dynamic>),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: json['data'] != null && json['data']['widgets'] != null
          ? ((json['data']['widgets'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, WidgetModelEntity.fromJson(e))))
          : null,
      repostedPosts:
          json['data'] != null && json['data']['reposted_posts'] != null
              ? ((json['data']['reposted_posts'] as Map<String, dynamic>?)
                  ?.map((k, e) => MapEntry(k, PostEntity.fromJson(e))))
              : null,
      userTopics: (json['user_topics'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
              key, (value as List<dynamic>).map((e) => e.toString()).toList())),
    );

Map<String, dynamic> _$GetPostResponseEntityToJson(
        GetPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'post': instance.post?.toJson(),
        'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
        'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
        'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
        'reposted_posts':
            instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
        'user_topics': instance.userTopics,
      }
    };
