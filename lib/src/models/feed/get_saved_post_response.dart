import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';
part 'get_saved_post_response.g.dart';

class GetSavedPostResponse {
  bool success;
  String? errorMessage;
  List<Post>? posts;
  Map<String, Post>? repostedPosts;
  Map<String, Topic>? topics;
  Map<String, WidgetModel>? widgets;
  Map<String, User>? users;
  final Map<String, Comment>? filteredComments;
  final Map<String, List<String>>? userTopics;
  int? totalCount;

  GetSavedPostResponse({
    required this.success,
    this.errorMessage,
    this.posts,
    this.repostedPosts,
    this.topics,
    this.widgets,
    this.users,
    this.totalCount,
    this.filteredComments,
    this.userTopics,
  });

  factory GetSavedPostResponse.fromEntity(GetSavedPostResponseEntity entity) {
    return GetSavedPostResponse(
        success: entity.success,
        errorMessage: entity.errorMessage,
        posts:
            entity.posts?.map((e) => Post.fromEntity(postEntity: e)).toList(),
        repostedPosts: entity.repostedPosts?.map(
            (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
        topics: entity.topics
            ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
        widgets: entity.widgets
            ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
        users: entity.users
            ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
        totalCount: entity.totalCount,
        userTopics: entity.userTopics,
        filteredComments: entity.filteredComments?.map((key, value) =>
            MapEntry(key, Comment.fromEntity(commentEntity: value))));
  }

  GetSavedPostResponseEntity toEntity() {
    return GetSavedPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      posts: posts?.map((e) => e.toEntity()).toList(),
      repostedPosts:
          repostedPosts?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      totalCount: totalCount,
      filteredComments: filteredComments
          ?.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
    );
  }
}

@JsonSerializable()
class GetSavedPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<PostEntity>? posts;
  @JsonKey(name: 'reposted_post')
  final Map<String, PostEntity>? repostedPosts;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  final Map<String, UserEntity>? users;
  @JsonKey(name: 'total_count')
  final int? totalCount;
  final Map<String, CommentEntity>? filteredComments;
  final Map<String, List<String>>? userTopics;

  GetSavedPostResponseEntity({
    required this.success,
    this.errorMessage,
    this.posts,
    this.repostedPosts,
    this.topics,
    this.widgets,
    this.users,
    this.totalCount,
    this.filteredComments,
    this.userTopics,
  });

  factory GetSavedPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetSavedPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetSavedPostResponseEntityToJson(this);
}
