// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_unread_notification_count_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUnreadNotificationCountResponseEntity
    _$GetUnreadNotificationCountResponseEntityFromJson(
            Map<String, dynamic> json) =>
        GetUnreadNotificationCountResponseEntity(
          success: json['success'] as bool,
          errorMessage: json['errorMessage'] as String?,
          count: json['count'] as int?,
        );

Map<String, dynamic> _$GetUnreadNotificationCountResponseEntityToJson(
        GetUnreadNotificationCountResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'count': instance.count,
    };
