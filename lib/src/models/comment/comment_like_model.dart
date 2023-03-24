import 'package:json_annotation/json_annotation.dart';

part 'comment_like_model.g.dart';

class CommentLike {
  final String id;
  final int createdAt;
  final int updatedAt;
  final String userId;

  CommentLike({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory CommentLike.fromEntity(CommentLikeEntity entity) {
    return CommentLike(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      userId: entity.userId,
    );
  }

  CommentLikeEntity toEntity() {
    return CommentLikeEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
    );
  }
}

@JsonSerializable()
class CommentLikeEntity {
  final String id;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'user_id')
  final String userId;

  CommentLikeEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory CommentLikeEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentLikeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommentLikeEntityToJson(this);
}
