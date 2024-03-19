import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';
part 'search_post_response_model.g.dart';

class SearchPostResponse {
  final bool success;
  final String? errorMessage;
  final List<Post>? posts;
  final Map<String, Post>? repostedPosts;
  final Map<String, Topic>? topics;
  final Map<String, User>? users;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;

  SearchPostResponse({
    required this.success,
    this.errorMessage,
    this.posts,
    this.repostedPosts,
    this.topics,
    this.users,
    this.widgets,
    this.userTopics,
  });

  factory SearchPostResponse.fromEntity(SearchPostResponseEntity entity) {
    return SearchPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      posts: entity.posts?.map((e) => Post.fromEntity(postEntity: e)).toList(),
      repostedPosts: entity.repostedPosts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      userTopics: entity.userTopics,
    );
  }

  SearchPostResponseEntity toEntity() {
    return SearchPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      posts: posts?.map((e) => e.toEntity()).toList(),
      repostedPosts:
          repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable()
class SearchPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<PostEntity>? posts;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;
  final Map<String, TopicEntity>? topics;
  final Map<String, UserEntity>? users;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  SearchPostResponseEntity({
    required this.success,
    this.errorMessage,
    this.posts,
    this.repostedPosts,
    this.topics,
    this.users,
    this.userTopics,
    this.widgets,
  });

  factory SearchPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchPostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPostResponseEntityToJson(this);
}
