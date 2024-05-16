import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'get_all_pending_posts_response.g.dart';

class GetAllPendingPostsResponse {
  List<Post> posts;
  int totalCount;
  Map<String, User> users;
  Map<String, Topic> topics;
  Map<String, WidgetModel> widgets;
  Map<String, Post> repostedPosts;
  Map<String, List<String>> userTopics;
  Map<String, Comment> filteredComments;

  GetAllPendingPostsResponse({
    required this.posts,
    required this.totalCount,
    required this.users,
    required this.topics,
    required this.widgets,
    required this.repostedPosts,
    required this.userTopics,
    required this.filteredComments,
  });
}

@JsonSerializable()
class GetAllPendingPostsResponseEntity {
  final List<PostEntity>? posts;
  @JsonKey(name: 'total_count')
  final int? totalCount;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'reposted_posts')
  final Map<String, PostEntity>? repostedPosts;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? usersTopics;
  @JsonKey(name: 'filtered_comments')
  final Map<String, CommentEntity>? filteredCommentsEntity;

  GetAllPendingPostsResponseEntity({
    this.posts,
    this.totalCount,
    this.users,
    this.topics,
    this.widgets,
    this.repostedPosts,
    this.usersTopics,
    this.filteredCommentsEntity,
  });

  factory GetAllPendingPostsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllPendingPostsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllPendingPostsResponseEntityToJson(this);

  GetAllPendingPostsResponse toResponse() {
    return GetAllPendingPostsResponse(
      posts: posts?.map((e) => Post.fromEntity(postEntity: e)).toList() ?? [],
      totalCount: totalCount ?? 0,
      users:
          users?.map((key, value) => MapEntry(key, User.fromEntity(value))) ??
              {},
      topics:
          topics?.map((key, value) => MapEntry(key, Topic.fromEntity(value))) ??
              {},
      widgets: widgets?.map(
              (key, value) => MapEntry(key, WidgetModel.fromEntity(value))) ??
          {},
      repostedPosts: repostedPosts?.map((key, value) =>
              MapEntry(key, Post.fromEntity(postEntity: value))) ??
          {},
      userTopics: usersTopics ?? {},
      filteredComments: filteredCommentsEntity?.map((key, value) =>
              MapEntry(key, Comment.fromEntity(commentEntity: value))) ??
          {},
    );
  }
}
