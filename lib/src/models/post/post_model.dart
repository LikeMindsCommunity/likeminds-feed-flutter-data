// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:likeminds_feed/src/models/feed/post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

import 'package:likeminds_feed/src/models/post/attachment_model.dart';
import 'package:likeminds_feed/src/models/post/popup_menu_item_model.dart';

part 'post_model.g.dart';

class Post {
  final String id;
  final String text;
  final List<Attachment>? attachments;
  final int communityId;
  final bool isPinned;
  final String userId;
  int likeCount;
  int commentCount;
  bool isSaved;
  final bool isLiked;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final List<Topic>? topics;

  Post({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.commentCount,
    required this.isEdited,
    required this.topics,
  });

  factory Post.fromEntity({required PostEntity postEntity}) {
    return Post(
        id: postEntity.id,
        isEdited: postEntity.isEdited,
        text: postEntity.text,
        attachments: postEntity.attachments
            ?.map((e) => Attachment.fromEntity(e))
            .toList(),
        communityId: postEntity.communityId,
        isPinned: postEntity.isPinned,
        userId: postEntity.userId,
        likeCount: postEntity.likeCount,
        commentCount: postEntity.commentCount,
        isSaved: postEntity.isSaved,
        isLiked: postEntity.isLiked,
        menuItems: postEntity.menuItems
            .map((e) => PopupMenuItemModel.fromEntity(entity: e))
            .toList(),
        topics: postEntity.topics?.map((e) => Topic.fromEntity(e)).toList(),
        createdAt: DateTime.fromMillisecondsSinceEpoch(postEntity.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(postEntity.updatedAt));
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      text: text,
      isEdited: isEdited,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      communityId: communityId,
      isPinned: isPinned,
      userId: userId,
      likeCount: likeCount,
      isSaved: isSaved,
      isLiked: isLiked,
      commentCount: commentCount,
      menuItems: menuItems.map((e) => e.toEntity()).toList(),
      createdAt: createdAt.millisecondsSinceEpoch.toInt(),
      updatedAt: updatedAt.millisecondsSinceEpoch.toInt(),
      topics: topics?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostEntity {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @JsonKey(name: 'is_edited')
  final bool isEdited;
  @JsonKey(name: 'comments_count')
  final int commentCount;
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
  final List<TopicEntity>? topics;
  PostEntity({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.commentCount,
    required this.isEdited,
    required this.topics,
  });
  factory PostEntity.fromJson(Map<String, dynamic> data) =>
      _$PostEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
