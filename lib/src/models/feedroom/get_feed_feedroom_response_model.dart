import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_feed_feedroom_response_model.g.dart';

class GetFeedOfFeedRoomResponse {
  final bool success;
  final String? errorMessage;
  final List<Post>? posts;
  final Map<String, User> users;
  final Map<String, Topic> topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, Comment>? filteredComments;
  final Map<String, List<String>>? userTopics;

  GetFeedOfFeedRoomResponse({
    required this.success,
    required this.errorMessage,
    required this.posts,
    required this.users,
    required this.topics,
    this.widgets,
    this.filteredComments,
    this.repostedPosts,
    this.userTopics,
  });

  factory GetFeedOfFeedRoomResponse.fromEntity(
          {required GetFeedOfFeedRoomResponseEntity entity}) =>
      GetFeedOfFeedRoomResponse(
        success: entity.success,
        errorMessage: entity.errorMessage,
        posts:
            entity.posts?.map((e) => Post.fromEntity(postEntity: e)).toList(),
        users: entity.users
            .map((key, value) => MapEntry(key, User.fromEntity(value))),
        topics: entity.topics
            .map((key, value) => MapEntry(key, Topic.fromEntity(value))),
        widgets: entity.widgets
            ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
        repostedPosts: entity.repostedPosts?.map(
            (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
        filteredComments: entity.filteredCommentsEntity?.map((key, value) =>
            MapEntry(key, Comment.fromEntity(commentEntity: value))),
        userTopics: entity.usersTopics,
      );

  GetFeedOfFeedRoomResponseEntity toEntity() => GetFeedOfFeedRoomResponseEntity(
        success: success,
        errorMessage: errorMessage,
        posts: posts?.map((e) => e.toEntity()).toList(),
        users: users.map((key, value) => MapEntry(key, value.toEntity())),
        topics: topics.map((key, value) => MapEntry(key, value.toEntity())),
        widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
        repostedPosts:
            repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
        filteredCommentsEntity: filteredComments
            ?.map((key, value) => MapEntry(key, value.toEntity())),
        usersTopics: userTopics,
      );
}

@JsonSerializable()
class GetFeedOfFeedRoomResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<PostEntity>? posts;
  final Map<String, UserEntity> users;
  final Map<String, TopicEntity> topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'filtered_comments')
  final Map<String, CommentEntity>? filteredCommentsEntity;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? usersTopics;

  GetFeedOfFeedRoomResponseEntity({
    required this.success,
    required this.errorMessage,
    required this.posts,
    required this.users,
    required this.topics,
    this.filteredCommentsEntity,
    this.repostedPosts,
    this.usersTopics,
    this.widgets,
  });

  factory GetFeedOfFeedRoomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedOfFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetFeedOfFeedRoomResponseEntityToJson(this);
}
