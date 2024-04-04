// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed_feedroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedOfFeedRoomResponseEntity _$GetFeedOfFeedRoomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedOfFeedRoomResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      posts: (json['data']['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
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
      usersTopics: (json['data']['user_topics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$GetFeedOfFeedRoomResponseEntityToJson(
        GetFeedOfFeedRoomResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'posts': instance.posts?.map((e) => e.toJson()).toList(),
        'users':
            instance.users.map((key, value) => MapEntry(key, value.toJson())),
        'topics':
            instance.topics.map((key, value) => MapEntry(key, value.toJson())),
        'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
        'reposted_posts':
            instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
        'filtered_comments': instance.filteredCommentsEntity
            ?.map((k, e) => MapEntry(k, e.toJson())),
        'user_topics': instance.usersTopics?.map((k, e) => MapEntry(k, e)),
      }
    };
