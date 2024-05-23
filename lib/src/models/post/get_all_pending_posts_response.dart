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

  GetAllPendingPostsResponseEntity toEntity() {
    return GetAllPendingPostsResponseEntity(
      posts: posts.map((post) => post.toEntity()).toList(),
      totalCount: totalCount,
      users: users.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets.map((key, value) => MapEntry(key, value.toEntity())),
      repostedPosts:
          repostedPosts.map((key, value) => MapEntry(key, value.toEntity())),
      usersTopics: userTopics,
      filteredCommentsEntity:
          filteredComments.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }

  GetAllPendingPostsResponse.fromEntity(GetAllPendingPostsResponseEntity entity)
      : posts = entity.posts
                ?.map((postEntity) => Post.fromEntity(postEntity: postEntity))
                .toList() ??
            [],
        totalCount = entity.totalCount ?? 0,
        users = entity.users
                ?.map((key, value) => MapEntry(key, User.fromEntity(value))) ??
            {},
        topics = entity.topics
                ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))) ??
            {},
        widgets = entity.widgets?.map(
                (key, value) => MapEntry(key, WidgetModel.fromEntity(value))) ??
            {},
        repostedPosts = entity.repostedPosts?.map((key, value) =>
                MapEntry(key, Post.fromEntity(postEntity: value))) ??
            {},
        userTopics = entity.usersTopics ?? {},
        filteredComments = entity.filteredCommentsEntity?.map((key, value) =>
                MapEntry(key, Comment.fromEntity(commentEntity: value))) ??
            {};
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
}
