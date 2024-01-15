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

  AddPostResponse({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.user,
    required this.topics,
    required this.widgets,
    required this.repostedPosts,
  });

  factory AddPostResponse.fromEntity({required AddPostResponseEntity entity}) {
    return AddPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post,
      user: entity.users,
      topics: entity.topics?.map(
        (key, value) => MapEntry(
          key,
          Topic.fromEntity(value),
        ),
      ),
      widgets: entity.widgets,
      repostedPosts: entity.repostedPosts?.map(
        (key, value) => MapEntry(
          key,
          Post.fromEntity(postEntity: value),
        ),
      ),
    );
  }
}

@JsonSerializable()
class AddPostResponseEntity {
  final bool success;
  final Post? post;
  final Map<String, User>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModel>? widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;

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
  });

  factory AddPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostResponseEntityToJson(this);
}
