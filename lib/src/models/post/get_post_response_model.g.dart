// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostResponseEntity _$GetPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      post: json['data']['post'] == null
          ? null
          : PostEntity.fromJson(json['post'] as Map<String, dynamic>),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, PostUserEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetPostResponseEntityToJson(
        GetPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'post': instance.post?.toJson(),
      'users': instance.users.map((k, e) => MapEntry(k, e.toJson())),
    };
