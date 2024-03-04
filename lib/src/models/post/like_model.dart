import 'package:json_annotation/json_annotation.dart';

part 'like_model.g.dart';

class Like {
  final String id;
  final int createdAt;
  final int updatedAt;
  final String uuid;

  Like({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.uuid,
  });

  factory Like.fromEntity(LikeEntity entity) {
    return Like(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      uuid: entity.uuid,
    );
  }

  LikeEntity toEntity() {
    return LikeEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      uuid: uuid,
    );
  }
}

@JsonSerializable()
class LikeEntity {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'uuid')
  final String uuid;

  LikeEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.uuid,
  });

  factory LikeEntity.fromJson(Map<String, dynamic> json) =>
      _$LikeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LikeEntityToJson(this);
}
