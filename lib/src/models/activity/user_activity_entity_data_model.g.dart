// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_entity_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActivityEntityDataEntity _$UserActivityEntityDataEntityFromJson(
        Map<String, dynamic> json) =>
    UserActivityEntityDataEntity(
      id: json['_id'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: json['comments_count'] as int?,
      communityId: json['community_id'] as int,
      createdAt: json['created_at'] as int,
      heading: json['heading'] as String?,
      isEdited: json['is_edited'] as bool?,
      isLiked: json['is_liked'] as bool?,
      isPinned: json['is_pinned'] as bool?,
      isSaved: json['is_saved'] as bool?,
      level: json['level'] as int?,
      likesCount: json['likes_count'] as int?,
      menuItems: (json['menu_items'] as List<dynamic>?)
          ?.map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      postData: json['post_data'] == null
          ? null
          : PostEntity.fromJson(json['post_data'] as Map<String, dynamic>),
      postId: json['post_id'] as String?,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      tempId: json['temp_id'] as String?,
      text: json['text'] as String,
      topics:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
      updatedAt: json['updated_at'] as int?,
      userId: json['user_id'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$UserActivityEntityDataEntityToJson(
        UserActivityEntityDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'attachments': instance.attachments,
      'comments_count': instance.commentsCount,
      'community_id': instance.communityId,
      'created_at': instance.createdAt,
      'heading': instance.heading,
      'is_edited': instance.isEdited,
      'is_liked': instance.isLiked,
      'is_pinned': instance.isPinned,
      'is_saved': instance.isSaved,
      'level': instance.level,
      'likes_count': instance.likesCount,
      'menu_items': instance.menuItems,
      'post_data': instance.postData,
      'post_id': instance.postId,
      'replies': instance.replies,
      'temp_id': instance.tempId,
      'text': instance.text,
      'topics': instance.topics,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'uuid': instance.uuid,
    };
