// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => PostEntity(
      id: json['_id'] as String,
      text: json['text'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityId: json['community_id'] as int,
      isPinned: json['is_pinned'] as bool,
      uuid: json['uuid'] as String,
      likeCount: json['likes_count'] as int,
      isSaved: json['is_saved'] as bool,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLiked: json['is_liked'] as bool,
      commentCount: json['comments_count'] as int,
      isEdited: json['is_edited'] as bool,
      topicIds:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isRepost: json['is_repost'] as bool,
      isRepostedByUser: json['is_reposted_by_user'] as bool,
      repostCount: json['repost_count'] as int,
      isDeleted: json['is_deleted'] ?? false,
      heading: json['heading'] as String?,
      commentIds: (json['comment_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tempId: json['temp_id'] as String?,
    );

Map<String, dynamic> _$PostEntityToJson(PostEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'community_id': instance.communityId,
      'is_pinned': instance.isPinned,
      'is_liked': instance.isLiked,
      'is_edited': instance.isEdited,
      'comments_count': instance.commentCount,
      'uuid': instance.uuid,
      'likes_count': instance.likeCount,
      'is_saved': instance.isSaved,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'topics': instance.topicIds,
      'replies': instance.replies?.map((e) => e.toJson()).toList(),
      'is_repost': instance.isRepost,
      'is_reposted_by_user': instance.isRepostedByUser,
      'repost_count': instance.repostCount,
      'is_deleted': instance.isDeleted,
      'heading': instance.heading,
      'comment_ids': instance.commentIds,
      'temp_id': instance.tempId,
    };
