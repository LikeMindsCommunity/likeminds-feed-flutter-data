// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pending_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPendingPostResponseEntity _$GetPendingPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetPendingPostResponseEntity(
      post: json['post'] == null
          ? null
          : PostEntity.fromJson(json['post'] as Map<String, dynamic>),
      users: (json['users'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>))),
      topics: (json['topics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>))),
      widgets: ((json['widgets'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, WidgetModelEntity.fromJson(e)))),
      repostedPosts: (json['reposted_posts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, PostEntity.fromJson(e))),
      userTopics: (json['user_topics'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
              key, (value as List<dynamic>).map((e) => e.toString()).toList())),
    );

Map<String, dynamic> _$GetPendingPostResponseEntityToJson(
        GetPendingPostResponseEntity instance) =>
    <String, dynamic>{
      'post': instance.post?.toJson(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
      'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
      'reposted_posts':
          instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
      'user_topics': instance.userTopics,
    };
