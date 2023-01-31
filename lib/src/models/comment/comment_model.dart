import 'package:feed_sdk/src/models/post/popup_menu_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

class Comment {
  final String userId;
  final String text;
  final int level;
  final int likesCount;
  final int repliesCount;
  final List<PopupMenuItemModel> menuItems;

  Comment({
    required this.userId,
    required this.text,
    required this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
  });

  factory Comment.fromEntity({required CommentEntity commentEntity}) {
    return Comment(
      userId: commentEntity.userId,
      text: commentEntity.text,
      level: commentEntity.level,
      likesCount: commentEntity.likesCount,
      repliesCount: commentEntity.repliesCount,
      menuItems: commentEntity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
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
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CommentEntity {
  @JsonKey(name: 'user_id')
  final String userId;
  final String text;
  final int level;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'replies_count')
  final int repliesCount;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;

  CommentEntity({
    required this.userId,
    required this.text,
    required this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> data) =>
      _$CommentEntityFromJson(data);

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);
}
