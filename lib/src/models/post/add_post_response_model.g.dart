// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseEntity _$AddPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddPostResponseEntity(
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
      topics: (json['data']['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: json['data'] != null &&
              json['data']['widgets'] != null &&
              json['data']['widgets'].isNotEmpty
          ? ((json['data']['widgets'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, WidgetModel.fromEntity(WidgetModelEntity.fromJson(e)))))
          : null,
      repostedPosts:
          json['data'] != null && json['data']['reposted_posst'] != null
              ? (json['data']['reposted_posts'] as Map<String, dynamic>?)?.map(
                  (k, e) => MapEntry(
                    k,
                    PostEntity.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : {},
    );

Map<String, dynamic> _$AddPostResponseEntityToJson(
        AddPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'post': instance.post,
      'users': instance.users,
      'reposted_posts': instance.repostedPosts,
    };
