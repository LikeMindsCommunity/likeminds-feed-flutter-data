import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_comment_likes_response_model.g.dart';

class GetCommentLikesResponse {
  final bool success;
  final String? errorMessage;
  final List<Like>? commentLikes;
  final Map<String, User>? users;
  final int? totalCount;

  GetCommentLikesResponse({
    required this.success,
    this.errorMessage,
    this.commentLikes,
    this.users,
    this.totalCount,
  });

  factory GetCommentLikesResponse.fromEntity(
      GetCommentLikesResponseEntity entity) {
    return GetCommentLikesResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      commentLikes:
          entity.commentLikes?.map((e) => Like.fromEntity(e)).toList(),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      totalCount: entity.totalCount,
    );
  }

  GetCommentLikesResponseEntity toEntity() {
    return GetCommentLikesResponseEntity(
      success: success,
      errorMessage: errorMessage,
      commentLikes: commentLikes?.map((e) => e.toEntity()).toList(),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      totalCount: totalCount,
    );
  }
}

@JsonSerializable()
class GetCommentLikesResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'likes')
  final List<LikeEntity>? commentLikes;
  @JsonKey(name: 'users')
  final Map<String, UserEntity>? users;
  @JsonKey(name: 'total_count')
  final int? totalCount;

  GetCommentLikesResponseEntity({
    required this.success,
    this.errorMessage,
    this.commentLikes,
    this.users,
    this.totalCount,
  });

  factory GetCommentLikesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetCommentLikesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommentLikesResponseEntityToJson(this);
}
