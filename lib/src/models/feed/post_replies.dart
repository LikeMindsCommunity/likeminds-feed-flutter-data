// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feed_sdk/src/models/post/attachment_model.dart';
import 'package:feed_sdk/src/models/post/popup_menu_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_replies.g.dart';

class PostReplies {
  final String id;
  final String text;
  final List<Attachment>? attachments;
  final int communityId;
  final bool isPinned;
  final String userId;
  final int likeCount;
  final bool isSaved;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
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
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.replies,
  });

  factory PostReplies.fromEntity(PostRepliesEntity entity) {
    return PostReplies(
        id: entity.id,
        text: entity.text,
        communityId: entity.communityId,
        isPinned: entity.isPinned,
        userId: entity.userId,
        likeCount: entity.likeCount,
        isSaved: entity.isSaved,
        menuItems: entity.menuItems
            .map((e) => PopupMenuItemModel.fromEntity(entity: e))
            .toList(),
        createdAt: DateTime.fromMillisecondsSinceEpoch(entity.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(entity.updatedAt),
        replies: entity.replies.map((e) => Reply.fromEntity(e)).toList(),
        attachments: entity.attachments != null
            ? entity.attachments?.map((e) => Attachment.fromEntity(e)).toList()
            : null);
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
  @JsonKey(name: 'is_saved')
  final bool isSaved;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final List<ReplyEntity> replies;
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
  final int repliesCount;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isLiked;
  Reply(
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
        id: replyEntity.id);
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
  @JsonKey(name: 'replies_count')
  final int? repliesCount;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;

  @JsonKey(name: 'is_liked')
  final bool isLiked;
  ReplyEntity(
      {required this.id,
      required this.userId,
      required this.text,
      required this.level,
      required this.likesCount,
      required this.repliesCount,
      required this.menuItems,
      required this.createdAt,
      required this.updatedAt,
      required this.isLiked});
  factory ReplyEntity.fromJson(Map<String, dynamic> data) =>
      _$ReplyEntityFromJson(data);

  Map<String, dynamic> toJson() => _$ReplyEntityToJson(this);
}
