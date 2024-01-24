// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  PostDetailResponse({
    this.post,
    required this.success,
    this.errorMessage,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
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
      widgets: entity.widgets,
      repostedPosts: entity.repostedPosts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostDetailResponseEntity {
  final bool success;
  final String? errorMessage;
  @JsonKey(name: 'post')
  final PostEntity? postReplies;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModel>? widgets;
  @JsonKey(name: 'reposted_post')
  final Map<String, PostEntity>? repostedPosts;

  PostDetailResponseEntity({
    required this.success,
    this.errorMessage,
    this.postReplies,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
  });
  factory PostDetailResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$PostDetailResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostDetailResponseEntityToJson(this);
}
