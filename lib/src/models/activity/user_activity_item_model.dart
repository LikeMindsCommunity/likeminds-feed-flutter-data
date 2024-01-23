import 'package:likeminds_feed/src/models/activity/user_activity_entity_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_activity_item_model.g.dart';

class UserActivityItem {
  String id;
  int action;
  List<String> actionBy;
  String actionOn;
  UserActivityEntityData activityEntityData;
  String activityText;
  int createdAt;
  String? cta;
  String entityId;
  String? entityOwnerId;
  int entityType;
  bool isRead;
  int updatedAt;
  String uuid;

  UserActivityItem({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    required this.activityEntityData,
    required this.activityText,
    required this.createdAt,
    this.cta,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
    required this.uuid,
  });

  factory UserActivityItem.fromEntity(UserActivityItemEntity entity) {
    return UserActivityItem(
      id: entity.id,
      action: entity.action,
      actionBy: entity.actionBy,
      actionOn: entity.actionOn,
      activityEntityData:
          UserActivityEntityData.fromEntity(entity.activityEntityData),
      activityText: entity.activityText,
      createdAt: entity.createdAt,
      cta: entity.cta,
      entityId: entity.entityId,
      entityOwnerId: entity.entityOwnerId,
      entityType: entity.entityType,
      isRead: entity.isRead,
      updatedAt: entity.updatedAt,
      uuid: entity.uuid,
    );
  }

  UserActivityItemEntity toEntity() {
    return UserActivityItemEntity(
      id: id,
      action: action,
      actionBy: actionBy,
      actionOn: actionOn,
      activityEntityData: activityEntityData.toEntity(),
      activityText: activityText,
      createdAt: createdAt,
      cta: cta,
      entityId: entityId,
      entityOwnerId: entityOwnerId,
      entityType: entityType,
      isRead: isRead,
      updatedAt: updatedAt,
      uuid: uuid,
    );
  }
}

@JsonSerializable()
class UserActivityItemEntity {
  @JsonKey(name: '_id')
  String id;
  int action;
  @JsonKey(name: 'action_by')
  List<String> actionBy;
  @JsonKey(name: 'action_on')
  String actionOn;
  @JsonKey(name: 'activity_entity_data')
  UserActivityEntityDataEntity activityEntityData;
  @JsonKey(name: 'activity_text')
  String activityText;
  @JsonKey(name: 'created_at')
  int createdAt;
  String? cta;
  @JsonKey(name: 'entity_id')
  String entityId;
  @JsonKey(name: 'entity_owner_id')
  String? entityOwnerId;
  @JsonKey(name: 'entity_type')
  int entityType;
  @JsonKey(name: 'is_read')
  bool isRead;
  @JsonKey(name: 'updated_at')
  int updatedAt;
  String uuid;
  UserActivityItemEntity({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    required this.activityEntityData,
    required this.activityText,
    required this.createdAt,
    this.cta,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
    required this.uuid,
  });

  factory UserActivityItemEntity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserActivityItemEntityToJson(this);
}
