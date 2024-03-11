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
    );

Map<String, dynamic> _$GetUserFeedMetaResponseEntityToJson(
        GetUserFeedMetaResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'comments_count': instance.commentsCount,
      'posts_count': instance.postsCount,
      'users': instance.users,
      'widgets': instance.widgets,
    };
