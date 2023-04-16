// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPostResponseEntity _$EditPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      post: Post.fromEntity(
        postEntity:
            PostEntity.fromJson(json['data']['post'] as Map<String, dynamic>),
      ),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          User.fromEntity(
            UserEntity.fromJson(value),
          ),
        ),
      ),
    );

Map<String, dynamic> _$EditPostResponseEntityToJson(
        EditPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'post': instance.post?.toEntity().toJson(),
      'users': instance.users,
    };
