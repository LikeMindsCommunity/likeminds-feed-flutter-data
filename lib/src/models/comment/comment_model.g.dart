// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    CommentEntity(
      userId: json['user_id'] as String,
      text: json['text'] as String,
      level: json['level'] as int?,
      likesCount: json['likes_count'] as int,
      repliesCount: json['comments_count'] as int,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) =>
              PopupMenuItemModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentComment: json['parent_comment'] != null
          ? CommentEntity.fromJson(
              json['parent_comment'] as Map<String, dynamic>)
          : null,
      uuid: json['uuid'],
      tempId: json['temp_id'],
      id: json['_id'],
      isEdited: json['is_edited'],
      isLiked: json['is_liked'],
      postId: json['post_id'],
    );

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'text': instance.text,
      'level': instance.level,
      'likes_count': instance.likesCount,
      'comments_count': instance.repliesCount,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_Aat': instance.updatedAt,
      'replies': instance.replies?.map((e) => e.toJson()).toList(),
      'parent_comment': instance.parentComment?.toJson(),
      'uuid': instance.uuid,
      'temp_id': instance.tempId,
      '_id': instance.id,
      'is_edited': instance.isEdited,
      'is_liked': instance.isLiked,
      'post_id': instance.postId,
    };
