import 'package:json_annotation/json_annotation.dart';

part 'like_model.g.dart';

class Like {
  final String id;
  final int createdAt;
  final int updatedAt;
  final String userId;

  Like({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory Like.fromEntity(LikeEntity entity) {
    return Like(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      userId: entity.userId,
    );
  }

  LikeEntity toEntity() {
    return LikeEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
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
  @JsonKey(name: 'user_id')
  final String userId;

  LikeEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory LikeEntity.fromJson(Map<String, dynamic> json) =>
      _$LikeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LikeEntityToJson(this);
}
