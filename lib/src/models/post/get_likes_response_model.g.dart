// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_likes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostLikesResponseEntity _$GetPostLikesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetPostLikesResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      likes: (json['data']['likes'] as List<dynamic>?)
          ?.map((e) => LikeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['data']['total_count'] as int?,
      users: (json['data']['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetPostLikesResponseEntityToJson(
        GetPostLikesResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'likes': instance.likes,
      'total_count': instance.totalCount,
      'users': instance.users,
    };
