import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'edit_pending_post_response_model.g.dart';

class EditPendingPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? user;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, List<String>>? userTopics;

  EditPendingPostResponse({
    required this.success,
    this.errorMessage,
    this.post,
    this.user,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory EditPendingPostResponse.fromEntity(
      EditPendingPostResponseEntity entity) {
    return EditPendingPostResponse(
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
      userTopics: entity.userTopics,
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
    );
  }

  EditPendingPostResponseEntity toEntity() {
    return EditPendingPostResponseEntity(
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
      userTopics: userTopics,
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
    );
  }
}

@JsonSerializable()
class EditPendingPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final PostEntity? post;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  EditPendingPostResponseEntity({
    required this.success,
    this.errorMessage,
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory EditPendingPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditPendingPostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditPendingPostResponseEntityToJson(this);
}
