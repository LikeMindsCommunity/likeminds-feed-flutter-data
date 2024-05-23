import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pending_post_response_model.g.dart';

class GetPendingPostResponse {
  final Post? post;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, Post>? repostedPosts;
  final Map<String, List<String>>? userTopics;

  GetPendingPostResponse({
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory GetPendingPostResponse.fromEntity(
      {required GetPendingPostResponseEntity entity}) {
    return GetPendingPostResponse(
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
      widgets: entity.widgets?.map((key, value) {
        return MapEntry(key, WidgetModel.fromEntity(value));
      }),
      repostedPosts: entity.repostedPosts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
      userTopics: entity.userTopics,
    );
  }

  GetPendingPostResponseEntity toEntity() {
    return GetPendingPostResponseEntity(
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
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      repostedPosts:
          repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetPendingPostResponseEntity {
  final PostEntity? post;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_post')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  GetPendingPostResponseEntity({
    this.post,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.userTopics,
  });

  factory GetPendingPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetPendingPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetPendingPostResponseEntityToJson(this);
}
