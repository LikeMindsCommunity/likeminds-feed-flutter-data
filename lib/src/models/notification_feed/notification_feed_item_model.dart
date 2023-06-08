import 'package:json_annotation/json_annotation.dart';

import 'package:likeminds_feed/src/models/notification_feed/activity_entity_data_model.dart';

part 'notification_feed_item_model.g.dart';

class NotificationFeedItem {
  final String id;
  final int action;
  final List<String> actionBy;
  final String actionOn;
  final ActivityEntityData activityEntityData;
  final String activityText;
  final String? cta;
  final int createdAt;
  final String entityId;
  final String? entityOwnerId;
  final int entityType;
  final bool isRead;
  final int updatedAt;

  NotificationFeedItem({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    required this.activityEntityData,
    required this.activityText,
    this.cta,
    required this.createdAt,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
  });

  factory NotificationFeedItem.fromEntity(NotificationFeedItemEntity entity) {
    return NotificationFeedItem(
      id: entity.id,
      action: entity.action,
      actionBy: entity.actionBy,
      actionOn: entity.actionOn,
      activityEntityData: entity.activityEntityData,
      activityText: entity.activityText,
      createdAt: entity.createdAt,
      cta: entity.cta,
      entityId: entity.entityId,
      entityOwnerId: entity.entityOwnerId,
      entityType: entity.entityType,
      isRead: entity.isRead,
      updatedAt: entity.updatedAt,
    );
  }

  NotificationFeedItemEntity toEntity() {
    return NotificationFeedItemEntity(
      id: id,
      action: action,
      actionBy: actionBy,
      actionOn: actionOn,
      activityEntityData: activityEntityData,
      activityText: activityText,
      createdAt: createdAt,
      cta: cta,
      entityId: entityId,
      entityOwnerId: entityOwnerId,
      entityType: entityType,
      isRead: isRead,
      updatedAt: updatedAt,
    );
  }
}

@JsonSerializable()
class NotificationFeedItemEntity {
  final String id;
  final int action;
  final List<String> actionBy;
  final String actionOn;
  final ActivityEntityData activityEntityData;
  final String activityText;
  final String? cta;
  final int createdAt;
  final String entityId;
  final String? entityOwnerId;
  final int entityType;
  final bool isRead;
  final int updatedAt;

  NotificationFeedItemEntity({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    required this.activityEntityData,
    required this.activityText,
    this.cta,
    required this.createdAt,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
  });

  factory NotificationFeedItemEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationFeedItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationFeedItemEntityToJson(this);
}
