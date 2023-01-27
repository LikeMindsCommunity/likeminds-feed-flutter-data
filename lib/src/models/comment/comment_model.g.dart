// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    CommentEntity(
      userId: json['user_id'] as String,
      text: json['text'] as String,
      level: json['level'] as int,
      likesCount: json['likes_count'] as int,
      repliesCount: json['replies_count'] as int,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) => MenuItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'text': instance.text,
      'level': instance.level,
      'likes_count': instance.likesCount,
      'replies_count': instance.repliesCount,
      'menu_items': instance.menuItems.map((e) => e.toJson()).toList(),
    };
