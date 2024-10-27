// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:likeminds_feed/src/models/feed/post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'post_model.g.dart';

/// {@template post_data}
/// A class that represents a post in the application.
/// It contains details such as the post text, attachments, community ID,
/// like and comment counts, and various states like
/// whether the post is liked, pinned, or edited.
/// {@endtemplate}
class Post {
// Post Details
  final String id; // Unique identifier for the post
  final String uuid; // Unique identifier for the creator of post
  final int communityId; // ID of the community to which the post belongs
  final String? tempId; // Temporary identifier for the post (nullable)
  final int?
      feedroomId; // ID of the feedroom to which the post belongs (nullable)

  // Post Data
  final String text; // Text content of the post
  final String? heading; // Heading or title of the post (nullable)
  final List<String>?
      commentIds; // List of IDs for comments on the post (nullable)
  final List<String>?
      topicIds; // List of IDs for topics associated with the post (nullable)
  final List<Attachment>?
      attachments; // List of attachments for the post (nullable)
  final List<Comment>?
      replies; // List of replies or comments on the post (nullable)

  int likeCount; // Number of likes for the post
  int commentCount; // Number of comments on the post
  final int repostCount; // Number of reposts for the post

  final List<PopupMenuItemModel>
      menuItems; // List of menu items associated with the post

  // Post Date and Time
  final DateTime createdAt; // Date and time when the post was created
  final DateTime updatedAt; // Date and time when the post was last updated

  // Post States
  final bool isLiked; // Whether the post is liked by the current user
  final bool isPinned; // Whether the post is pinned or not
  bool isSaved; // Whether the post is saved by the current user
  final bool isEdited; // Whether the post has been edited
  final bool? isDeleted; // Whether the post has been deleted (nullable)
  final bool isRepost; // Whether the post is a repost
  final bool
      isRepostedByUser; // Whether the post is a repost by the current user
  final bool isPendingPost; // Whether the post is pending approval
  final String postStatus; // Status of the post (e.g. under_review, rejected)

  /// {@macro post_data}
  Post({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    this.feedroomId,
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
    required this.topicIds,
    this.replies,
    required this.isRepost,
    required this.isRepostedByUser,
    required this.repostCount,
    this.isDeleted,
    this.heading,
    this.commentIds,
    this.tempId,
    required this.isPendingPost,
    required this.postStatus,
  });

  /// {@template post_data_from_entity}
  /// Converts a [PostEntity] into a [Post] object.
  /// {@endtemplate}
  factory Post.fromEntity({required PostEntity postEntity}) {
    return Post(
      id: postEntity.id,
      isEdited: postEntity.isEdited,
      text: postEntity.text,
      attachments:
          postEntity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
      communityId: postEntity.communityId,
      feedroomId: postEntity.feedroomId,
      isPinned: postEntity.isPinned,
      uuid: postEntity.uuid,
      likeCount: postEntity.likeCount,
      commentCount: postEntity.commentCount,
      isSaved: postEntity.isSaved,
      isLiked: postEntity.isLiked,
      menuItems: postEntity.menuItems
          .map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      topicIds: postEntity.topicIds,
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
      isPendingPost: postEntity.isPendingPost,
      postStatus: postEntity.postStatus,
    );
  }

  /// {@template post_data_to_entity}
  /// Converts a [Post] object into a [PostEntity].
  /// {@endtemplate}
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      text: text,
      isEdited: isEdited,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      communityId: communityId,
      feedroomId: feedroomId,
      isPinned: isPinned,
      uuid: uuid,
      likeCount: likeCount,
      isSaved: isSaved,
      isLiked: isLiked,
      commentCount: commentCount,
      menuItems: menuItems.map((e) => e.toEntity()).toList(),
      createdAt: createdAt.millisecondsSinceEpoch.toInt(),
      updatedAt: updatedAt.millisecondsSinceEpoch.toInt(),
      topicIds: topicIds,
      replies: replies?.map((e) => e.toEntity()).toList(),
      isRepost: isRepost,
      isRepostedByUser: isRepostedByUser,
      repostCount: repostCount,
      isDeleted: isDeleted,
      heading: heading,
      commentIds: commentIds,
      tempId: tempId,
      isPendingPost: isPendingPost,
      postStatus: postStatus,
    );
  }
}

/// {@template post_data_entity}
/// Entity class for [Post] model
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class PostEntity {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'feedroom_id')
  final int? feedroomId;
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
  final List<String>? topicIds;
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
  @JsonKey(name: 'is_pending_post')
  final bool isPendingPost;
  @JsonKey(name: 'post_status')
  final String postStatus;

  /// {@macro post_data_entity}
  PostEntity(
      {required this.id,
      required this.text,
      required this.attachments,
      required this.communityId,
      this.feedroomId,
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
      required this.topicIds,
      this.replies,
      required this.isRepost,
      required this.isRepostedByUser,
      required this.repostCount,
      this.isDeleted,
      this.heading,
      this.commentIds,
      this.tempId,
      required this.isPendingPost,
      required this.postStatus});

  /// {@template post_data_entity_from_json}
  /// Converts a [Map<String, dynamic>] into a [PostEntity] object.
  /// {@endtemplate}
  factory PostEntity.fromJson(Map<String, dynamic> data) =>
      _$PostEntityFromJson(data);

  /// {@template post_data_entity_to_json}
  /// Converts a [PostEntity] object into a [Map<String, dynamic>].
  /// {@endtemplate}
  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
