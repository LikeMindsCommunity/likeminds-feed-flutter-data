// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_activity_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserActivityResponseEntity _$GetUserActivityResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetUserActivityResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      activities: (json['data']['activities'] as List<dynamic>?)
          ?.map(
              (e) => UserActivityItemEntity.fromJson(e as Map<String, dynamic>))
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
    );

Map<String, dynamic> _$GetUserActivityResponseEntityToJson(
        GetUserActivityResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'activities': instance.activities?.map((e) => e.toJson()).toList(),
        'users':
            instance.users?.map((key, value) => MapEntry(key, value.toJson())),
        'topics':
            instance.topics?.map((key, value) => MapEntry(key, value.toJson())),
        'widgets': instance.widgets
            ?.map((key, value) => MapEntry(key, value.toJson())),
        'reposted_posts': instance.repostedPosts
            ?.map((key, value) => MapEntry(key, value.toJson())),
      }
    };
