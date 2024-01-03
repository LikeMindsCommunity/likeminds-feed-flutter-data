import 'package:likeminds_feed/src/models/post/popup_menu_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

class Comment {
  final String id;
  final bool isLiked;
  final bool isEdited;
  final String userId;
  final String text;
  final int? level;
  final int likesCount;
  final int repliesCount;
  final int createdAt;
  final int updatedAt;
  final List<Comment>? replies;
  final List<PopupMenuItemModel> menuItems;
  final Comment? parentComment;
  final String uuid;
  final String? tempId;

  Comment({
    required this.id,
    required this.isLiked,
    required this.isEdited,
    required this.userId,
    required this.text,
    this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
    required this.menuItems,
    required this.parentComment,
    required this.uuid,
    this.tempId,
  });

  factory Comment.fromEntity({required CommentEntity commentEntity}) {
    return Comment(
      id: commentEntity.id,
      isLiked: commentEntity.isLiked,
      isEdited: commentEntity.isEdited,
      userId: commentEntity.userId,
      text: commentEntity.text,
      level: commentEntity.level,
      likesCount: commentEntity.likesCount,
      repliesCount: commentEntity.repliesCount,
      createdAt: commentEntity.createdAt,
      updatedAt: commentEntity.updatedAt,
      replies: commentEntity.replies
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      menuItems: commentEntity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      parentComment: commentEntity.parentComment != null
          ? Comment.fromEntity(commentEntity: commentEntity.parentComment!)
          : null,
      uuid: commentEntity.uuid,
    );
  }

  CommentEntity toEntity() {
    return CommentEntity(
      userId: userId,
      text: text,
      level: level,
      likesCount: likesCount,
      repliesCount: repliesCount,
      menuItems: menuItems.map((e) => e.toEntity()).toList(),
      id: id,
      isLiked: isLiked,
      isEdited: isEdited,
      createdAt: createdAt,
      updatedAt: updatedAt,
      replies: replies?.map((e) => e.toEntity()).toList(),
      parentComment: parentComment?.toEntity(),
      uuid: uuid,
      tempId: tempId,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CommentEntity {
  @JsonKey(name: 'user_id')
  final String userId;
  final String text;
  final int? level;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'replies_count')
  final int repliesCount;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  final String id;
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @JsonKey(name: 'is_edited')
  final bool isEdited;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'replies')
  final List<CommentEntity>? replies;
  @JsonKey(name: 'parent_comment')
  final CommentEntity? parentComment;
  final String uuid;
  @JsonKey(name: 'temp_id')
  final String? tempId;

  CommentEntity({
    required this.userId,
    required this.text,
    this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
    required this.id,
    required this.isLiked,
    required this.isEdited,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
    required this.parentComment,
    required this.uuid,
    this.tempId,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> data) =>
      _$CommentEntityFromJson(data);

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);
}
