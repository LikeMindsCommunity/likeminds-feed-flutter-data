// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActivityItemEntity _$UserActivityItemEntityFromJson(
        Map<String, dynamic> json) =>
    UserActivityItemEntity(
      id: json['_id'] as String,
      action: json['action'] as int,
      actionBy:
          (json['action_by'] as List<dynamic>).map((e) => e as String).toList(),
      actionOn: json['action_on'] as String,
      activityEntityData: UserActivityEntityDataEntity.fromJson(
          json['activity_entity_data'] as Map<String, dynamic>),
      activityText: json['activity_text'] as String,
      createdAt: json['created_at'] as int,
      cta: json['cta'] as String?,
      entityId: json['entity_id'] as String,
      entityOwnerId: json['entity_owner_id'] as String?,
      entityType: json['entity_type'] as int,
      isRead: json['is_read'] as bool,
      updatedAt: json['updated_at'] as int,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$UserActivityItemEntityToJson(
        UserActivityItemEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'action': instance.action,
      'action_by': instance.actionBy,
      'action_on': instance.actionOn,
      'activity_entity_data': instance.activityEntityData,
      'activity_text': instance.activityText,
      'created_at': instance.createdAt,
      'cta': instance.cta,
      'entity_id': instance.entityId,
      'entity_owner_id': instance.entityOwnerId,
      'entity_type': instance.entityType,
      'is_read': instance.isRead,
      'updated_at': instance.updatedAt,
      'uuid': instance.uuid,
    };
