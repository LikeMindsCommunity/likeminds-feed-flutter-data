// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserCommentsResponseEntity _$GetUserCommentsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetUserCommentsResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      comments: (json['data']?['comments'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']?['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      posts: (json['data']?['posts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, PostEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetUserCommentsResponseEntityToJson(
        GetUserCommentsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'comments': instance.comments,
      'users': instance.users,
      'posts': instance.posts,
    };
