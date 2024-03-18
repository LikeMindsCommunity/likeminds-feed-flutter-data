// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPostResponseEntity _$SearchPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SearchPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      posts: (json['data']?['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      repostedPosts:
          (json['data']?['reposted_posts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']?['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      users: (json['data']?['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']?['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SearchPostResponseEntityToJson(
        SearchPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'posts': instance.posts,
        'reposted_posts': instance.repostedPosts,
        'topics': instance.topics,
        'users': instance.users,
        'widgets': instance.widgets,
      }
    };
