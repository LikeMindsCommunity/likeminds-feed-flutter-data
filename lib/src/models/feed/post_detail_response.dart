import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_detail_response.g.dart';

class PostDetailResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, List<String>>? userTopics;

  PostDetailResponse({
    this.post,
    required this.success,
    this.errorMessage,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory PostDetailResponse.fromEntity(PostDetailResponseEntity entity) {
    return PostDetailResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.postReplies == null
          ? null
          : Post.fromEntity(postEntity: entity.postReplies!),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      repostedPosts: entity.repostedPosts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      userTopics: entity.userTopics,
    );
  }

  PostDetailResponseEntity toEntity() {
    return PostDetailResponseEntity(
      success: success,
      errorMessage: errorMessage,
      postReplies: post?.toEntity(),
      users: users?.map((key, value) {
        return MapEntry(key, value.toEntity());
      }),
      topics: topics?.map(
        (key, value) => MapEntry(
          key,
          value.toEntity(),
        ),
      ),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      repostedPosts:
          repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostDetailResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'post')
  final PostEntity? postReplies;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_post')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  PostDetailResponseEntity({
    required this.success,
    this.errorMessage,
    this.postReplies,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });
  factory PostDetailResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$PostDetailResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostDetailResponseEntityToJson(this);
}
