// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:feed_sdk/feed_sdk.dart';

part 'comment_replies.g.dart';

class CommentReplies {
  final String id;
  final String text;
  final String? postId;
  final int commentsCount;
  final int level;
  final Map? parentComment;

  final String userId;
  final int likesCount;

  final List<PopupMenuItemModel> menuItems;
  final bool? isLiked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<CommentReply> replies;
  CommentReplies({
    required this.isLiked,
    required this.id,
    required this.text,
    required this.userId,
    required this.likesCount,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
    required this.postId,
    required this.commentsCount,
    required this.level,
    required this.parentComment,
  });

  factory CommentReplies.fromEntity(CommentRepliesEntity entity) {
    return CommentReplies(
      id: entity.id,
      text: entity.text,
      userId: entity.userId,
      likesCount: entity.likesCount,
      menuItems: entity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(entity.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(entity.updatedAt),
      replies: entity.replies.map((e) => CommentReply.fromEntity(e)).toList(),
      commentsCount: entity.commentsCount,
      level: entity.level,
      parentComment: entity.parentComment,
      postId: entity.postId,
      isLiked: entity.isLiked,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CommentRepliesEntity {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  @JsonKey(name: 'post_id')
  final String? postId;
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @JsonKey(name: 'level')
  final int level;
  @JsonKey(name: 'parent_comment')
  final Map? parentComment;

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'likes_count')
  final int likesCount;

  @JsonKey(name: 'is_liked')
  final bool? isLiked;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final List<CommentReplyEntity> replies;
  CommentRepliesEntity(
      {required this.id,
      required this.text,
      required this.userId,
      required this.likesCount,
      required this.menuItems,
      required this.createdAt,
      required this.updatedAt,
      required this.replies,
      required this.commentsCount,
      required this.level,
      required this.parentComment,
      required this.postId,
      required this.isLiked});
  factory CommentRepliesEntity.fromJson(Map<String, dynamic> data) =>
      _$CommentRepliesEntityFromJson(data);

  Map<String, dynamic> toJson() => _$CommentRepliesEntityToJson(this);
}

class CommentReply {
  final String id;
  final String userId;
  final String text;
  final int level;
  final int likesCount;
  final int repliesCount;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isLiked;
  CommentReply(
      {required this.userId,
      required this.text,
      required this.level,
      required this.likesCount,
      required this.repliesCount,
      required this.menuItems,
      required this.createdAt,
      required this.updatedAt,
      required this.isLiked,
      required this.id});

  factory CommentReply.fromEntity(CommentReplyEntity replyEntity) {
    return CommentReply(
        userId: replyEntity.userId,
        text: replyEntity.text,
        level: replyEntity.level,
        likesCount: replyEntity.likesCount,
        repliesCount: replyEntity.commentsCount ?? 0,
        menuItems: replyEntity.menuItems
            .map((e) => PopupMenuItemModel.fromEntity(entity: e))
            .toList(),
        createdAt: DateTime.fromMillisecondsSinceEpoch(replyEntity.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(replyEntity.updatedAt),
        isLiked: replyEntity.isLiked,
        id: replyEntity.id);
  }
}

@JsonSerializable(explicitToJson: true)
class CommentReplyEntity {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String text;
  final int level;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'comments_count')
  final int? commentsCount;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;

  @JsonKey(name: 'is_liked')
  final bool isLiked;
  CommentReplyEntity(
      {required this.id,
      required this.userId,
      required this.text,
      required this.level,
      required this.likesCount,
      required this.commentsCount,
      required this.menuItems,
      required this.createdAt,
      required this.updatedAt,
      required this.isLiked});
  factory CommentReplyEntity.fromJson(Map<String, dynamic> data) =>
      _$CommentReplyEntityFromJson(data);

  Map<String, dynamic> toJson() => _$CommentReplyEntityToJson(this);
}
