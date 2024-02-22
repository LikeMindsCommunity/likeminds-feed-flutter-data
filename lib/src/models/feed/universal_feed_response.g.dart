// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'universal_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedResponseEntity _$GetFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      posts: (json['data']['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      repostedPosts:
          (json['data']['reposted_posts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>)),
      ),
      filteredCommentsEntity:
          (json['data']['filtered_comments'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, CommentEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetFeedResponseEntityToJson(
        GetFeedResponseEntity instance) =>
    <String, dynamic>{
      'posts': instance.posts?.map((e) => e.toJson()).toList(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
      'reposted_posts':
          instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
      'filtered_comments': instance.filteredCommentsEntity
          ?.map((k, e) => MapEntry(k, e.toJson())),
    };
