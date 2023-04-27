// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/post/attachment_model.dart';
import 'package:likeminds_feed/src/models/post/popup_menu_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_replies.g.dart';

class PostReplies {
  final String id;
  final String text;
  final List<Attachment>? attachments;
  final int communityId;
  final bool isPinned;
  final bool isLiked;
  final String userId;
  final int likeCount;
  int commentsCount;
  final bool isSaved;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool? isEdited;
  final List<Reply> replies;

  PostReplies({
    required this.id,
    required this.text,
    this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.commentsCount,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
    required this.isLiked,
    this.isEdited,
  });

  factory PostReplies.fromEntity(PostRepliesEntity entity) {
    return PostReplies(
      id: entity.id,
      text: entity.text,
      communityId: entity.communityId,
      isPinned: entity.isPinned,
      userId: entity.userId,
      likeCount: entity.likeCount,
      commentsCount: entity.commentsCount,
      isSaved: entity.isSaved,
      isLiked: entity.isLiked,
      isEdited: entity.isEdited,
      menuItems: entity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(entity.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(entity.updatedAt),
      replies: entity.replies.map((e) => Reply.fromEntity(e)).toList(),
      attachments:
          entity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostRepliesEntity {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'likes_count')
  final int likeCount;
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @JsonKey(name: 'is_saved')
  final bool isSaved;
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final List<ReplyEntity> replies;
  @JsonKey(name: 'is_edited')
  final bool? isEdited;

  PostRepliesEntity({
    required this.id,
    required this.text,
    this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
    required this.isLiked,
    required this.commentsCount,
    this.isEdited,
  });

  factory PostRepliesEntity.fromJson(Map<String, dynamic> data) =>
      _$PostRepliesEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostRepliesEntityToJson(this);
}

class Reply {
  final String id;
  final String userId;
  final String text;
  final int level;
  final int likesCount;
  final bool? isEdited;
  int repliesCount;
  final Reply? parentComment;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isLiked;

  Reply({
    required this.userId,
    required this.text,
    required this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.id,
    this.isEdited,
    this.parentComment,
  });

  factory Reply.fromEntity(ReplyEntity replyEntity) {
    return Reply(
      userId: replyEntity.userId,
      text: replyEntity.text,
      level: replyEntity.level,
      likesCount: replyEntity.likesCount,
      repliesCount: replyEntity.repliesCount ?? 0,
      menuItems: replyEntity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(replyEntity.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(replyEntity.updatedAt),
      isLiked: replyEntity.isLiked,
      id: replyEntity.id,
      parentComment: replyEntity.parentComment,
      isEdited: replyEntity.isEdited,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ReplyEntity {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String text;
  final int level;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'comments_count')
  final int? repliesCount;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'parent_comment')
  final Reply? parentComment;
  @JsonKey(name: 'is_edited')
  final bool? isEdited;

  @JsonKey(name: 'is_liked')
  final bool isLiked;

  ReplyEntity({
    required this.id,
    required this.userId,
    required this.text,
    required this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    this.parentComment,
    this.isEdited,
  });

  factory ReplyEntity.fromJson(Map<String, dynamic> data) =>
      _$ReplyEntityFromJson(data);

  Map<String, dynamic> toJson() => _$ReplyEntityToJson(this);
}
