import 'package:json_annotation/json_annotation.dart';

import 'activity_entity_data_model.dart';

part 'notification_feed_item_model.g.dart';

/// Represents a notification feed item.
class NotificationFeedItem {
  /// The unique identifier of the notification.
  final String id;

  /// The action type of the notification.
  final int action;

  /// The list of user IDs who performed the action.
  final List<String> actionBy;

  /// The ID of the entity on which the action was performed.
  final String actionOn;

  /// The data related to the activity entity.
  final ActivityEntityData? activityEntityData;

  /// The text describing the activity.
  final String activityText;

  /// The call-to-action URL or text.
  final String? cta;

  /// The timestamp when the notification was created.
  final int createdAt;

  /// The ID of the entity related to the notification.
  final String entityId;

  /// The ID of the owner of the entity related to the notification.
  final String? entityOwnerId;

  /// The type of the entity related to the notification.
  final int entityType;

  /// Indicates whether the notification has been read.
  bool isRead;

  /// The timestamp when the notification was last updated.
  final int updatedAt;

  /// Creates a new instance of [NotificationFeedItem].
  NotificationFeedItem({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    this.activityEntityData,
    required this.activityText,
    this.cta,
    required this.createdAt,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
  });

  /// Creates a [NotificationFeedItem] from a [NotificationFeedItemEntity].
  factory NotificationFeedItem.fromEntity(NotificationFeedItemEntity entity) {
    return NotificationFeedItem(
      id: entity.id,
      action: entity.action,
      actionBy: entity.actionBy,
      actionOn: entity.actionOn,
      activityEntityData: entity.activityEntityData == null
          ? null
          : ActivityEntityData.fromEntity(entity.activityEntityData!),
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

  /// Converts this [NotificationFeedItem] to a [NotificationFeedItemEntity].
  NotificationFeedItemEntity toEntity() {
    return NotificationFeedItemEntity(
      id: id,
      action: action,
      actionBy: actionBy,
      actionOn: actionOn,
      activityEntityData: activityEntityData?.toEntity(),
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

/// Represents a notification feed item entity used for JSON serialization.
@JsonSerializable()
class NotificationFeedItemEntity {
  /// The unique identifier of the notification.
  @JsonKey(name: '_id')
  final String id;

  /// The action type of the notification.
  final int action;

  /// The list of user IDs who performed the action.
  @JsonKey(name: 'action_by')
  final List<String> actionBy;

  /// The ID of the entity on which the action was performed.
  @JsonKey(name: 'action_on')
  final String actionOn;

  /// The data related to the activity entity.
  @JsonKey(name: 'activity_entity_data')
  final ActivityEntityDataEntity? activityEntityData;

  /// The text describing the activity.
  @JsonKey(name: 'activity_text')
  final String activityText;

  /// The call-to-action URL or text.
  final String? cta;

  /// The timestamp when the notification was created.
  @JsonKey(name: 'created_at')
  final int createdAt;

  /// The ID of the entity related to the notification.
  @JsonKey(name: 'entity_id')
  final String entityId;

  /// The ID of the owner of the entity related to the notification.
  @JsonKey(name: 'entity_owner_id')
  final String? entityOwnerId;

  /// The type of the entity related to the notification.
  @JsonKey(name: 'entity_type')
  final int entityType;

  /// Indicates whether the notification has been read.
  @JsonKey(name: 'is_read')
  final bool isRead;

  /// The timestamp when the notification was last updated.
  @JsonKey(name: 'updated_at')
  final int updatedAt;

  /// Creates a new instance of [NotificationFeedItemEntity].
  NotificationFeedItemEntity({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    this.activityEntityData,
    required this.activityText,
    this.cta,
    required this.createdAt,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
  });

  /// Creates a [NotificationFeedItemEntity] from a JSON map.
  factory NotificationFeedItemEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationFeedItemEntityFromJson(json);

  /// Converts this [NotificationFeedItemEntity] to a JSON map.
  Map<String, dynamic> toJson() => _$NotificationFeedItemEntityToJson(this);
}
