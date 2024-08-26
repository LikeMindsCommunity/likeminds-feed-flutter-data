import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_personalised_feed_response.g.dart';

class GetPersonalisedFeedResponse {
  final List<Post> posts;
  final Map<String, User> users;
  final Map<String, Topic> topics;
  final Map<String, WidgetModel> widgets;
  final Map<String, Post> repostedPosts;
  final Map<String, Comment> filteredComments;
  final Map<String, List<String>> userTopics;

  GetPersonalisedFeedResponse({
    required this.posts,
    required this.users,
    required this.topics,
    required this.widgets,
    required this.repostedPosts,
    required this.filteredComments,
    required this.userTopics,
  });

  factory GetPersonalisedFeedResponse.fromEntity(
      {required GetPersonalisedFeedResponseEntity entity}) {
    return GetPersonalisedFeedResponse(
      posts: entity.posts.map((e) => Post.fromEntity(postEntity: e)).toList(),
      users: entity.users
          .map((key, value) => MapEntry(key, User.fromEntity(value))),
      topics: entity.topics
          .map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          .map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      repostedPosts: entity.repostedPosts.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      filteredComments: entity.filteredCommentsEntity.map((key, value) =>
          MapEntry(key, Comment.fromEntity(commentEntity: value))),
      userTopics: entity.usersTopics,
    );
  }

  GetPersonalisedFeedResponseEntity toEntity() {
    return GetPersonalisedFeedResponseEntity(
      posts: posts.map((e) => e.toEntity()).toList(),
      users: users.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets.map((key, value) => MapEntry(key, value.toEntity())),
      repostedPosts:
          repostedPosts.map((key, value) => MapEntry(key, value.toEntity())),
      filteredCommentsEntity:
          filteredComments.map((key, value) => MapEntry(key, value.toEntity())),
      usersTopics: userTopics,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetPersonalisedFeedResponseEntity {
  final List<PostEntity> posts;
  final Map<String, UserEntity> users;
  final Map<String, TopicEntity> topics;
  final Map<String, WidgetModelEntity> widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity> repostedPosts;
  @JsonKey(name: 'filtered_comments')
  final Map<String, CommentEntity> filteredCommentsEntity;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>> usersTopics;

  GetPersonalisedFeedResponseEntity({
    required this.posts,
    required this.users,
    required this.topics,
    required this.widgets,
    required this.repostedPosts,
    required this.filteredCommentsEntity,
    required this.usersTopics,
  });

  factory GetPersonalisedFeedResponseEntity.fromJson(
          Map<String, dynamic> data) =>
      _$GetPersonalisedFeedResponseEntityFromJson(data);

  Map<String, dynamic> toJson() =>
      _$GetPersonalisedFeedResponseEntityToJson(this);
}