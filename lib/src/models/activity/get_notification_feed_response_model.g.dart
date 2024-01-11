// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationFeedResponseEntity _$GetNotificationFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetNotificationFeedResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      items: (json['data']['activities'] as List<dynamic>?)
          ?.map(
            (e) => NotificationFeedItemEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          UserEntity.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          TopicEntity.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
      widgets: (json['data']['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          WidgetModelEntity.fromJson(
            e as Map<String, dynamic>,
          ),
        ),
      ),
    );

Map<String, dynamic> _$GetNotificationFeedResponseEntityToJson(
        GetNotificationFeedResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'items': instance.items,
      'users': instance.users,
      'topics': instance.topics,
    };
