// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_topics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserTopicsResponseEntity _$GetUserTopicsResponseEntityFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['success'],
  );
  return GetUserTopicsResponseEntity(
    userTopics: (json['data']['user_topics'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
    topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
    ),
    widgets: (json['data']['widgets'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
    ),
    success: json['success'] as bool,
    users: (json['data']['users'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
    ),
    errorMessage: json['error_message'] as String?,
  );
}

Map<String, dynamic> _$GetUserTopicsResponseEntityToJson(
        GetUserTopicsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'user_topics': instance.userTopics,
        'topics': instance.topics,
        'widgets': instance.widgets,
        'users': instance.users,
      },
    };
