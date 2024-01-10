// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_read_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkReadNotificationResponseEntity _$MarkReadNotificationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    MarkReadNotificationResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$MarkReadNotificationResponseEntityToJson(
        MarkReadNotificationResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
