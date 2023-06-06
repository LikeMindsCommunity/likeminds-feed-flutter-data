// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_feed_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationFeedItemEntity _$NotificationFeedItemEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationFeedItemEntity(
      id: json['_id'] as String,
      action: json['action'] as int,
      actionBy: (json['action_by'] as List<dynamic>)
          .map(
            (e) => e.toString(),
          )
          .toList(),
      actionOn: json['action_on'] as String,
      activityEntityData: ActivityEntityData.fromEntity(
        ActivityEntityDataEntity.fromJson(
          json['activity_entity_data'],
        ),
      ),
      activityText: json['activity_text'] as String,
      activityUserData: json['activity_user_data'] as Map<String, dynamic>,
      createdAt: json['created_at'] as int,
      cta: json['cta'] as String?,
      entityId: json['entity_id'] as String,
      entityOwnerId: json['entity_owner_id'] as String?,
      entityType: json['entity_type'] as int,
      isRead: json['is_read'] as bool,
      updatedAt: json['updated_at'] as int,
    );

Map<String, dynamic> _$NotificationFeedItemEntityToJson(
        NotificationFeedItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'actionBy': instance.actionBy,
      'actionOn': instance.actionOn,
      'activityEntityData': instance.activityEntityData,
      'activityText': instance.activityText,
      'activityUserData': instance.activityUserData,
      'cta': instance.cta,
      'createdAt': instance.createdAt,
      'entityId': instance.entityId,
      'entityOwnerId': instance.entityOwnerId,
      'entityType': instance.entityType,
      'isRead': instance.isRead,
      'updatedAt': instance.updatedAt,
    };
