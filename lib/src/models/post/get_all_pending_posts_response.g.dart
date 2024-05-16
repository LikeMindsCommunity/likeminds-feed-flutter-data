// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_pending_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllPendingPostsResponseEntity _$GetAllPendingPostsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllPendingPostsResponseEntity(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      repostedPosts: (json['reposted_posts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>)),
      ),
      filteredCommentsEntity:
          (json['filtered_comments'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, CommentEntity.fromJson(e as Map<String, dynamic>)),
      ),
      usersTopics: (json['user_topics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );
Map<String, dynamic> _$GetAllPendingPostsResponseEntityToJson(
        GetAllPendingPostsResponseEntity instance) =>
    <String, dynamic>{
      'posts': instance.posts?.map((e) => e.toJson()).toList(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
      'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
      'reposted_posts':
          instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
      'filtered_comments': instance.filteredCommentsEntity
          ?.map((k, e) => MapEntry(k, e.toJson())),
      'user_topics': instance.usersTopics?.map((k, e) => MapEntry(k, e)),
    };
