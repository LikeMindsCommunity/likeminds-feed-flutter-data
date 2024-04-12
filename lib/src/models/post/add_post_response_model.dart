import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'add_post_response_model.g.dart';

class AddPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? user;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, List<String>>? userTopics;

  AddPostResponse({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.user,
    required this.topics,
    required this.widgets,
    required this.repostedPosts,
    this.userTopics,
  });

  factory AddPostResponse.fromEntity({required AddPostResponseEntity entity}) {
    return AddPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post != null
          ? Post.fromEntity(postEntity: entity.post!)
          : null,
      user: entity.users?.map(
        (key, value) => MapEntry(
          key,
          User.fromEntity(value),
        ),
      ),
      topics: entity.topics?.map(
        (key, value) => MapEntry(
          key,
          Topic.fromEntity(value),
        ),
      ),
      widgets: entity.widgets?.map(
        (key, value) => MapEntry(
          key,
          WidgetModel.fromEntity(value),
        ),
      ),
      repostedPosts: entity.repostedPosts?.map(
        (key, value) => MapEntry(
          key,
          Post.fromEntity(postEntity: value),
        ),
      ),
      userTopics: entity.userTopics,
    );
  }

  AddPostResponseEntity toEntity() {
    return AddPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      post: post?.toEntity(),
      users: user?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      topics: topics?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      widgets: widgets?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      repostedPosts: repostedPosts?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable()
class AddPostResponseEntity {
  final bool success;
  final PostEntity? post;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  AddPostResponseEntity({
    required this.success,
    required this.errorMessage,
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory AddPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostResponseEntityToJson(this);
}
