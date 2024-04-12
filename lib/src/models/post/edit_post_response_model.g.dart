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
      post: PostEntity.fromJson(json['data']['post'] as Map<String, dynamic>),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          UserEntity.fromJson(value),
        ),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userTopics: (json['data']['user_topics'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List<dynamic>).map((e) => e as String).toList())),
      widgets: json['data'] != null &&
              json['data']['widgets'] != null &&
              json['data']['widgets'].isNotEmpty
          ? ((json['data']['widgets'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e)))
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
        'post': instance.post?.toJson(),
        'users':
            instance.users?.map((key, value) => MapEntry(key, value.toJson())),
        'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
        'widgets': instance.widgets?.map((k, e) => MapEntry(k, e.toJson())),
        'reposted_posts':
            instance.repostedPosts?.map((k, e) => MapEntry(k, e.toJson())),
        'user_topics': instance.userTopics?.map((k, e) => MapEntry(k, e)),
      }
    };
