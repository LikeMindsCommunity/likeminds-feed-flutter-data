import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_post_response_model.g.dart';

class GetPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, List<String>>? userTopics;

  GetPostResponse({
    required this.success,
    this.errorMessage,
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory GetPostResponse.fromEntity({required GetPostResponseEntity entity}) {
    return GetPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post != null
          ? Post.fromEntity(postEntity: entity.post!)
          : null,
      users: entity.users?.map((key, value) {
        return MapEntry(key, User.fromEntity(value));
      }),
      topics: entity.topics?.map(
        (key, value) => MapEntry(
          key,
          Topic.fromEntity(value),
        ),
      ),
      widgets: entity.widgets,
      repostedPosts: entity.repostedPosts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      userTopics: entity.userTopics,
    );
  }

  GetPostResponseEntity toEntity() {
    return GetPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      post: post?.toEntity(),
      users: users?.map((key, value) {
        return MapEntry(key, value.toEntity());
      }),
      topics: topics?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      widgets: widgets,
      repostedPosts:
          repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final PostEntity? post;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModel>? widgets;
  @JsonKey(name: 'reposted_post')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  GetPostResponseEntity({
    required this.success,
    this.errorMessage,
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory GetPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetPostResponseEntityToJson(this);
}
