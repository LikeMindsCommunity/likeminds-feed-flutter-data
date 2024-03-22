import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';
part 'get_user_comment_response.g.dart';

class GetUserCommentsResponse {
  final bool success;
  final String? errorMessage;
  final List<Comment>? comments;
  final Map<String, User>? users;
  final Map<String, Post>? posts;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;

  GetUserCommentsResponse({
    required this.success,
    this.errorMessage,
    this.comments,
    this.users,
    this.posts,
    this.topics,
    this.widgets,
    this.userTopics,
  });

  factory GetUserCommentsResponse.fromEntity(
      GetUserCommentsResponseEntity entity) {
    return GetUserCommentsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      comments: entity.comments
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      posts: entity.posts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      userTopics: entity.userTopics,
    );
  }

  GetUserCommentsResponseEntity toEntity() {
    return GetUserCommentsResponseEntity(
      success: success,
      errorMessage: errorMessage,
      comments: comments?.map((e) => e.toEntity()).toList(),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      posts: posts?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable()
class GetUserCommentsResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<CommentEntity>? comments;
  final Map<String, UserEntity>? users;
  final Map<String, PostEntity>? posts;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  GetUserCommentsResponseEntity({
    required this.success,
    this.errorMessage,
    this.comments,
    this.users,
    this.posts,
    this.topics,
    this.widgets,
    this.userTopics,
  });

  factory GetUserCommentsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserCommentsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserCommentsResponseEntityToJson(this);
}
