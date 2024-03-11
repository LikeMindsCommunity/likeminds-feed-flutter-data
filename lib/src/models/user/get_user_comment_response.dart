import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';
part 'get_user_comment_response.g.dart';

class GetUserCommentsResponse {
  final bool success;
  final String? errorMessage;
  final List<Comment>? comments;
  final Map<String, User>? users;
  final Map<String, Post>? posts;

  GetUserCommentsResponse({
    required this.success,
    this.errorMessage,
    this.comments,
    this.users,
    this.posts,
  });

  factory GetUserCommentsResponse.fromEntity(
      GetUserCommentsResponseEntity entity) {
    return GetUserCommentsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      comments: entity.comments
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      posts: entity.posts?.map(
          (key, value) => MapEntry(key, Post.fromEntity(postEntity: value))),
    );
  }

  GetUserCommentsResponseEntity toEntity() {
    return GetUserCommentsResponseEntity(
      success: success,
      errorMessage: errorMessage,
      comments: comments?.map((e) => e.toEntity()).toList(),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      posts: posts?.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}

@JsonSerializable()
class GetUserCommentsResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<CommentEntity>? comments;
  final Map<String, UserEntity>? users;
  final Map<String, PostEntity>? posts;

  GetUserCommentsResponseEntity({
    required this.success,
    this.errorMessage,
    this.comments,
    this.users,
    this.posts,
  });

  factory GetUserCommentsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserCommentsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserCommentsResponseEntityToJson(this);
}
