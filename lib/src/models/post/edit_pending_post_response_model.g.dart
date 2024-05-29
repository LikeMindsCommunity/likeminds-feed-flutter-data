// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_pending_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPendingPostResponseEntity _$EditPendingPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditPendingPostResponseEntity(
      post: PostEntity.fromJson(json['post'] as Map<String, dynamic>),
      users: (json['users'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, UserEntity.fromJson(value))) ??
          {},
      topics: (json['topics'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      userTopics: (json['user_topics'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, (e as List<dynamic>).map((e) => e as String).toList())) ??
          {},
      widgets: ((json['widgets'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, WidgetModelEntity.fromJson(e)))) ??
          {},
      repostedPosts: (json['reposted_posts'] as Map<String, dynamic>?)?.map((k,
                  e) =>
              MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>))) ??
          {},
    );

Map<String, dynamic> _$EditPendingPostResponseEntityToJson(
        EditPendingPostResponseEntity instance) =>
    <String, dynamic>{
      'data': {
        'post': instance.post.toJson(),
        'users':
            instance.users.map((key, value) => MapEntry(key, value.toJson())),
        'topics': instance.topics.map((k, e) => MapEntry(k, e.toJson())),
        'widgets': instance.widgets.map((k, e) => MapEntry(k, e.toJson())),
        'reposted_posts':
            instance.repostedPosts.map((k, e) => MapEntry(k, e.toJson())),
        'user_topics': instance.userTopics.map((k, e) => MapEntry(k, e)),
      }
    };
