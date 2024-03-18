import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

class GetUserFeedMetaResponse {
  GetUserFeedMetaResponse({
    required this.success,
    this.errorMessage,
    this.commentsCount,
    this.likesCount,
    this.topics,
    this.userTopics,
    this.users,
    this.widgets,
  });

  final bool success;
  final String? errorMessage;
  final int? commentsCount;
  final int? likesCount;
  final Map<String, Topic>? topics;
  final Map<String, List<String>>? userTopics;
  final Map<String, User>? users;
  final Map<String, WidgetModel>? widgets;

  factory GetUserFeedMetaResponse.fromEntity(
      GetUserFeedMetaResponseEntity entity) {
    return GetUserFeedMetaResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      commentsCount: entity.commentsCount,
      likesCount: entity.likesCount,
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      userTopics: entity.userTopics,
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
    );
  }

  GetUserFeedMetaResponseEntity toEntity() {
    return GetUserFeedMetaResponseEntity(
      success: success,
      errorMessage: errorMessage,
      commentsCount: commentsCount,
      likesCount: likesCount,
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}

class GetUserFeedMetaResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'comments_count')
  final int? commentsCount;
  @JsonKey(name: 'likes_count')
  final int? likesCount;
  final Map<String, TopicEntity>? topics;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;
  @JsonKey(name: 'users')
  final Map<String, UserEntity>? users;
  @JsonKey(name: 'widgets')
  final Map<String, WidgetModelEntity>? widgets;

  GetUserFeedMetaResponseEntity({
    required this.success,
    this.errorMessage,
    this.commentsCount,
    this.likesCount,
    this.topics,
    this.userTopics,
    this.users,
    this.widgets,
  });

  factory GetUserFeedMetaResponseEntity.fromJson(Map<String, dynamic> data) =>
      GetUserFeedMetaResponseEntity(
        success: data['success'] as bool,
        commentsCount: data['comments_count'] as int,
        likesCount: data['likes_count'] as int,
        topics: (data['topics'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
        ),
        userTopics: (data['user_topics'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List<dynamic>).map((e) => e as String).toList()),
        ),
        users: (data['users'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
        ),
        widgets: (data['widgets'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': success,
        'comments_count': commentsCount,
        'likes_count': likesCount,
        'topics': topics,
        'user_topics': userTopics,
        'users': users,
        'widgets': widgets,
      };
}
