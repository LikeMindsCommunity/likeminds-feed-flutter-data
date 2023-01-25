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
      userId: json['user_id'] as String,
      likeCount: json['likes_count'] as int,
      isSaved: json['is_saved'] as bool,
      menuItems: (json['menu_items'] as List<dynamic>)
          .map((e) => MenuItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
    );

Map<String, dynamic> _$PostEntityToJson(PostEntity instance) =>
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
    };
