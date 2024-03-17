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
          json['data'] != null && json['data']['reposted_posts'] != null
              ? (json['data']['reposted_posts'] as Map<String, dynamic>?)?.map(
                  (k, e) => MapEntry(
                    k,
                    PostEntity.fromJson(e as Map<String, dynamic>),
                  ),
                )
              : {},
    );

Map<String, dynamic> _$EditPostResponseEntityToJson(
        EditPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'post': instance.post?.toEntity().toJson(),
        'users': instance.users
            ?.map((key, value) => MapEntry(key, value.toEntity().toJson())),
        'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
        'widgets':
            instance.widgets?.map((k, e) => MapEntry(k, e.toEntity().toJson())),
        'reposted_posts':
            instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
      }
    };
