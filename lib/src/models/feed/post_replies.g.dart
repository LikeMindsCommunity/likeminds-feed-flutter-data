// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_replies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRepliesEntity _$PostRepliesEntityFromJson(Map<String, dynamic> json) =>
    PostRepliesEntity(
      id: json['_id'] as String,
      text: json['text'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityId: json['community_id'] as int,
      isPinned: json['is_pinned'] as bool,
      userId: json['user_id'] as String,
      likeCount: json['likes_count'] as int,
      isSaved: json['is_saved'] as bool,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      replies: (json['replies'] as List<dynamic>)
          .map((e) => ReplyEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostRepliesEntityToJson(PostRepliesEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'community_id': instance.communityId,
      'is_pinned': instance.isPinned,
      'user_id': instance.userId,
      'likes_count': instance.likeCount,
      'is_saved': instance.isSaved,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'replies': instance.replies.map((e) => e.toJson()).toList(),
    };

ReplyEntity _$ReplyEntityFromJson(Map<String, dynamic> json) => ReplyEntity(
      id: json['_id'] as String,
      userId: json['user_id'] as String,
      text: json['text'] as String,
      level: json['level'] as int,
      likesCount: json['likes_count'] as int,
      repliesCount: json['replies_count'] as int?,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$ReplyEntityToJson(ReplyEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'text': instance.text,
      'level': instance.level,
      'likes_count': instance.likesCount,
      'replies_count': instance.repliesCount,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_liked': instance.isLiked,
    };
