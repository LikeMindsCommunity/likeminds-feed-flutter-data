// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_replies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRepliesEntity _$CommentRepliesEntityFromJson(
        Map<String, dynamic> json) =>
    CommentRepliesEntity(
      id: json['_id'] as String,
      text: json['text'] as String,
      userId: json['user_id'] as String,
      likesCount: json['likes_count'] as int,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      replies: (json['replies'] as List<dynamic>)
          .map((e) => CommentReplyEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: json['comments_count'] as int,
      level: json['level'] as int,
      parentComment: json['parent_comment'] as Map<String, dynamic>?,
      postId: json['post_id'] as String?,
      isLiked: json['is_liked'] as bool?,
    );

Map<String, dynamic> _$CommentRepliesEntityToJson(
        CommentRepliesEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'post_id': instance.postId,
      'comments_count': instance.commentsCount,
      'level': instance.level,
      'parent_comment': instance.parentComment,
      'user_id': instance.userId,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'replies': instance.replies.map((e) => e.toJson()).toList(),
    };

CommentReplyEntity _$CommentReplyEntityFromJson(Map<String, dynamic> json) =>
    CommentReplyEntity(
      id: json['_id'] as String,
      userId: json['user_id'] as String,
      text: json['text'] as String,
      level: json['level'] as int,
      likesCount: json['likes_count'] as int,
      commentsCount: json['comments_count'] as int?,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      isLiked: json['is_liked'] as bool,
      isEdited: json['is_edited'] as bool?,
    );

Map<String, dynamic> _$CommentReplyEntityToJson(CommentReplyEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'text': instance.text,
      'level': instance.level,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_liked': instance.isLiked,
      'is_edited': instance.isEdited,
    };
