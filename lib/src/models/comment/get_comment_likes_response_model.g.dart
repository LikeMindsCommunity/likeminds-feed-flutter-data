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
          ?.map((e) => LikeEntity.fromJson(e as Map<String, dynamic>))
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
      'data': {
        'likes': instance.commentLikes?.map((e) => e.toJson()).toList(),
        'users':
            instance.users?.map((key, value) => MapEntry(key, value.toJson())),
        'total_count': instance.totalCount,
      }
    };
