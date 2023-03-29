// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentLikeEntity _$CommentLikeEntityFromJson(Map<String, dynamic> json) =>
    CommentLikeEntity(
      id: json['_id'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$CommentLikeEntityToJson(CommentLikeEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
    };
