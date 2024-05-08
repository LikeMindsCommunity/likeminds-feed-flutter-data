import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_activity_entity_data_model.g.dart';

class UserActivityEntityData {
  String id;
  List<Attachment>? attachments;
  int? commentsCount;
  int communityId;
  int createdAt;
  String? heading;
  bool? isEdited;
  bool? isLiked;
  bool? isPinned;
  bool? isSaved;
  int? level;
  int? likesCount;
  List<PopupMenuItemModel>? menuItems;
  Post? postData;
  String? postId;
  List<Comment>? replies;
  String? tempId;
  String text;
  List<String>? topicIds;
  int? updatedAt;
  String? uuid;
  bool? isRepost;
  bool? isRepostedByUser;
  int? repostCount;
  bool? isDeleted;

  UserActivityEntityData({
    required this.id,
    this.attachments,
    this.commentsCount,
    required this.communityId,
    required this.createdAt,
    this.heading,
    this.isEdited,
    this.isLiked,
    this.isPinned,
    this.isSaved,
    this.level,
    this.likesCount,
    this.menuItems,
    this.postData,
    this.postId,
    this.replies,
    this.tempId,
    required this.text,
    this.topicIds,
    this.updatedAt,
    this.uuid,
    this.isRepost,
    this.isRepostedByUser,
    this.repostCount,
    this.isDeleted,
  });

  factory UserActivityEntityData.fromEntity(
      UserActivityEntityDataEntity entity) {
    return UserActivityEntityData(
      id: entity.id,
      attachments:
          entity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
      commentsCount: entity.commentsCount,
      communityId: entity.communityId,
      createdAt: entity.createdAt,
      heading: entity.heading,
      isEdited: entity.isEdited,
      isLiked: entity.isLiked,
      isPinned: entity.isPinned,
      isSaved: entity.isSaved,
      level: entity.level,
      likesCount: entity.likesCount,
      menuItems: entity.menuItems
          ?.map((e) => PopupMenuItemModel.fromEntity(entity: e))
          .toList(),
      postData: entity.postData != null
          ? Post.fromEntity(postEntity: entity.postData!)
          : null,
      postId: entity.postId,
      replies: entity.replies
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      tempId: entity.tempId,
      text: entity.text,
      topicIds: entity.topicIds,
      updatedAt: entity.updatedAt,
      uuid: entity.uuid,
      isRepost: entity.isRepost,
      isRepostedByUser: entity.isRepostedByUser,
      repostCount: entity.repostCount,
      isDeleted: entity.isDeleted,
    );
  }

  UserActivityEntityDataEntity toEntity() {
    return UserActivityEntityDataEntity(
      id: id,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      commentsCount: commentsCount,
      communityId: communityId,
      createdAt: createdAt,
      heading: heading,
      isEdited: isEdited,
      isLiked: isLiked,
      isPinned: isPinned,
      isSaved: isSaved,
      level: level,
      likesCount: likesCount,
      menuItems: menuItems?.map((e) => e.toEntity()).toList(),
      postData: postData?.toEntity(),
      postId: postId,
      replies: replies?.map((e) => e.toEntity()).toList(),
      tempId: tempId,
      text: text,
      topicIds: topicIds,
      updatedAt: updatedAt,
      uuid: uuid,
      isRepost: isRepost,
      isRepostedByUser: isRepostedByUser,
      repostCount: repostCount,
      isDeleted: isDeleted,
    );
  }
}

@JsonSerializable()
class UserActivityEntityDataEntity {
  @JsonKey(name: '_id')
  String id;
  List<AttachmentEntity>? attachments;
  @JsonKey(name: 'comments_count')
  int? commentsCount;
  @JsonKey(name: 'community_id')
  int communityId;
  @JsonKey(name: 'created_at')
  int createdAt;
  String? heading;
  @JsonKey(name: 'is_edited')
  bool? isEdited;
  @JsonKey(name: 'is_liked')
  bool? isLiked;
  @JsonKey(name: 'is_pinned')
  bool? isPinned;
  @JsonKey(name: 'is_saved')
  bool? isSaved;
  int? level;
  @JsonKey(name: 'likes_count')
  int? likesCount;
  @JsonKey(name: 'menu_items')
  List<PopupMenuItemModelEntity>? menuItems;
  @JsonKey(name: 'post_data')
  PostEntity? postData;
  @JsonKey(name: 'post_id')
  String? postId;
  List<CommentEntity>? replies;
  @JsonKey(name: 'temp_id')
  String? tempId;
  String text;
  @JsonKey(name: 'topics')
  List<String>? topicIds;
  @JsonKey(name: 'updated_at')
  int? updatedAt;
  String? uuid;
  @JsonKey(name: 'is_repost')
  bool? isRepost;
  @JsonKey(name: 'is_reposted_by_user')
  bool? isRepostedByUser;
  @JsonKey(name: 'repost_count')
  int? repostCount;
  @JsonKey(name: 'is_deleted')
  bool? isDeleted;

  UserActivityEntityDataEntity({
    required this.id,
    this.attachments,
    this.commentsCount,
    required this.communityId,
    required this.createdAt,
    this.heading,
    this.isEdited,
    this.isLiked,
    this.isPinned,
    this.isSaved,
    this.level,
    this.likesCount,
    this.menuItems,
    this.postData,
    this.postId,
    this.replies,
    this.tempId,
    required this.text,
    this.topicIds,
    this.updatedAt,
    this.uuid,
    this.isRepost,
    this.isRepostedByUser,
    this.repostCount,
    this.isDeleted,
  });

  factory UserActivityEntityDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityEntityDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserActivityEntityDataEntityToJson(this);
}
