// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_saved_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSavedPostResponseEntity _$GetSavedPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetSavedPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      posts: (json['data']?['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      repostedPosts:
          (json['data']?['reposted_post'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']?['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']?['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      users: (json['data']?['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      totalCount: json['data']?['total_count'] as int?,
    );

Map<String, dynamic> _$GetSavedPostResponseEntityToJson(
        GetSavedPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      "data": {
        'posts': instance.posts,
        'reposted_post': instance.repostedPosts,
        'topics': instance.topics,
        'widgets': instance.widgets,
        'users': instance.users,
        'total_count': instance.totalCount,
      }
    };
