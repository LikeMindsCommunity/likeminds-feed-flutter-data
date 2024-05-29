// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_feed_meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserFeedMetaResponseEntity _$GetUserFeedMetaResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetUserFeedMetaResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      commentsCount: json['data']?['comments_count'] as int?,
      postsCount: json['data']?['posts_count'] as int?,
      users: (json['data']?['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']?['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userTopics: (json['data']?['user_topics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>))),
      pendingPostCount: (json['data']?['pending_posts_count'] as int?) ?? 0,
    );

Map<String, dynamic> _$GetUserFeedMetaResponseEntityToJson(
        GetUserFeedMetaResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'comments_count': instance.commentsCount,
        'posts_count': instance.postsCount,
        'pending_post_count': instance.pendingPostCount,
        'users':
            instance.users?.map((key, value) => MapEntry(key, value.toJson())),
        'widgets': instance.widgets
            ?.map((key, value) => MapEntry(key, value.toJson())),
        'user_topics': instance.userTopics,
        'topics':
            instance.topics?.map((key, value) => MapEntry(key, value.toJson())),
      }
    };
