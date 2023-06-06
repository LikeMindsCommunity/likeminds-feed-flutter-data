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
          ?.map((e) =>
              NotificationFeedItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNotificationFeedResponseEntityToJson(
        GetNotificationFeedResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'items': instance.items,
    };
