// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetailResponseEntity _$PostDetailResponseEntityFromJson(
    Map<String, dynamic> json) {
  return PostDetailResponseEntity(
    success: json['success'] as bool,
    errorMessage: json['error_message'] as String?,
    postReplies:
        PostEntity.fromJson(json['data']['post'] as Map<String, dynamic>),
    users: (json['data']['users'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
    ),
    topics: (json['data']['topics'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
    ),
    widgets: json['data'] != null &&
            json['data']['widgets'] != null &&
            json['data']['widgets'].isNotEmpty
        ? ((json['data']['widgets'] as Map<String, dynamic>?)?.map((k, e) =>
            MapEntry(k, WidgetModel.fromEntity(WidgetModelEntity.fromJson(e)))))
        : null,
    repostedPosts: json['data'] != null &&
            json['data']['reposted_posts'] != null &&
            json['data']['reposted_posts'].isNotEmpty
        ? ((json['data']['reposted_posts'] as Map<String, dynamic>?)
            ?.map((k, e) => MapEntry(k, PostEntity.fromJson(e))))
        : null,
  );
}

Map<String, dynamic> _$PostDetailResponseEntityToJson(
        PostDetailResponseEntity instance) =>
    <String, dynamic>{
      'post': instance.postReplies?.toJson(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
    };
