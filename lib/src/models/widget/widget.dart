import 'package:json_annotation/json_annotation.dart';

class WidgetModel {
  String id;
  Map<String, dynamic>? lmMeta;
  int createdAt;
  Map<String, dynamic> metadata;
  String parentEntityId;
  String parentEntityType;
  int updatedAt;

  WidgetModel({
    required this.id,
    this.lmMeta,
    required this.createdAt,
    required this.metadata,
    required this.parentEntityId,
    required this.parentEntityType,
    required this.updatedAt,
  });

  factory WidgetModel.fromEntity(WidgetModelEntity entity) {
    return WidgetModel(
      id: entity.id,
      lmMeta: entity.lmMeta,
      createdAt: entity.createdAt,
      metadata: entity.metadata,
      parentEntityId: entity.parentEntityId,
      parentEntityType: entity.parentEntityType,
      updatedAt: entity.updatedAt,
    );
  }

  WidgetModelEntity toEntity() {
    return WidgetModelEntity(
      id: id,
      lmMeta: lmMeta,
      createdAt: createdAt,
      metadata: metadata,
      parentEntityId: parentEntityId,
      parentEntityType: parentEntityType,
      updatedAt: updatedAt,
    );
  }
}

@JsonSerializable()
class WidgetModelEntity {
  String id;
  Map<String, dynamic>? lmMeta;
  int createdAt;
  Map<String, dynamic> metadata;
  String parentEntityId;
  String parentEntityType;
  int updatedAt;

  WidgetModelEntity({
    required this.id,
    required this.lmMeta,
    required this.createdAt,
    required this.metadata,
    required this.parentEntityId,
    required this.parentEntityType,
    required this.updatedAt,
  });

  factory WidgetModelEntity.fromJson(Map<String, dynamic> json) {
    return WidgetModelEntity(
      id: json['_id'],
      lmMeta: json['_lm_meta'],
      createdAt: json['created_at'],
      metadata: json['metadata'],
      parentEntityId: json['parent_entity_id'],
      parentEntityType: json['parent_entity_type'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      '_lm_meta': lmMeta,
      'created_at': createdAt,
      'metadata': metadata,
      'parent_entity_id': parentEntityId,
      'parent_entity_type': parentEntityType,
      'updated_at': updatedAt,
    };
  }
}
