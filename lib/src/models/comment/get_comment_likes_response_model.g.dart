// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_likes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentLikesResponseEntity _$GetCommentLikesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetCommentLikesResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      commentLikes: (json['data']['likes'] as List<dynamic>?)
          ?.map((e) => CommentLikeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      totalCount: json['data']['total_count'] as int?,
    );

Map<String, dynamic> _$GetCommentLikesResponseEntityToJson(
        GetCommentLikesResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'likes': instance.commentLikes,
      'users': instance.users,
      'total_count': instance.totalCount,
    };
