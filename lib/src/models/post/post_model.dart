// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:likeminds_feed/src/models/feed/post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'post_model.g.dart';

class Post {
  final String id;
  final String text;
  final List<Attachment>? attachments;
  final int communityId;
  final bool isPinned;
  final String uuid;
  int likeCount;
  int commentCount;
  bool isSaved;
  final bool isLiked;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final List<String>? topics;
  final List<Comment>? replies;
  final bool isRepost;
  final bool isRepostedByUser;
  final int repostCount;
  final bool? isDeleted;
  final String? heading;
  final List<String>? commentIds;
  final String? tempId;

  Post({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.uuid,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.commentCount,
    required this.isEdited,
    required this.topics,
    this.replies,
    required this.isRepost,
    required this.isRepostedByUser,
    required this.repostCount,
    this.isDeleted,
    this.heading,
    this.commentIds,
    this.tempId,
  });

  factory Post.fromEntity({required PostEntity postEntity}) {
    return Post(
      id: postEntity.id,
      isEdited: postEntity.isEdited,
      text: postEntity.text,
      attachments:
          postEntity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
      communityId: postEntity.communityId,
      isPinned: postEntity.isPinned,
      uuid: postEntity.uuid,
      likeCount: postEntity.likeCount,
      commentCount: postEntity.commentCount,
      isSaved: postEntity.isSaved,
      isLiked: postEntity.isLiked,
      menuItems: postEntity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      topics: postEntity.topics,
      createdAt: DateTime.fromMillisecondsSinceEpoch(postEntity.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(postEntity.updatedAt),
      replies: postEntity.replies
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      isRepost: postEntity.isRepost,
      isRepostedByUser: postEntity.isRepostedByUser,
      repostCount: postEntity.repostCount,
      isDeleted: postEntity.isDeleted,
      heading: postEntity.heading,
      commentIds: postEntity.commentIds,
      tempId: postEntity.tempId,
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      text: text,
      isEdited: isEdited,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      communityId: communityId,
      isPinned: isPinned,
      uuid: uuid,
      likeCount: likeCount,
      isSaved: isSaved,
      isLiked: isLiked,
      commentCount: commentCount,
      menuItems: menuItems.map((e) => e.toEntity()).toList(),
      createdAt: createdAt.millisecondsSinceEpoch.toInt(),
      updatedAt: updatedAt.millisecondsSinceEpoch.toInt(),
      topics: topics,
      replies: replies?.map((e) => e.toEntity()).toList(),
      isRepost: isRepost,
      isRepostedByUser: isRepostedByUser,
      repostCount: repostCount,
      isDeleted: isDeleted,
      heading: heading,
      commentIds: commentIds,
      tempId: tempId,
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
  @JsonKey(name: 'uuid')
  final String uuid;
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
  final List<String>? topics;
  @JsonKey(name: "replies")
  final List<CommentEntity>? replies;
  @JsonKey(name: 'is_repost')
  final bool isRepost;
  @JsonKey(name: 'is_reposted_by_user')
  final bool isRepostedByUser;
  @JsonKey(name: 'repost_count')
  final int repostCount;
  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;
  final String? heading;
  @JsonKey(name: 'comment_ids')
  final List<String>? commentIds;
  @JsonKey(name: 'temp_id')
  final String? tempId;

  PostEntity({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.uuid,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.commentCount,
    required this.isEdited,
    required this.topics,
    this.replies,
    required this.isRepost,
    required this.isRepostedByUser,
    required this.repostCount,
    this.isDeleted,
    this.heading,
    this.commentIds,
    this.tempId,
  });

  factory PostEntity.fromJson(Map<String, dynamic> data) =>
      _$PostEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
