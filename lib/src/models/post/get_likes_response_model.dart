import 'package:feed_sdk/src/models/post/like_model.dart';
import 'package:feed_sdk/src/models/post/post_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_likes_response_model.g.dart';

class GetPostLikesResponse {
  final bool success;
  final String? errorMessage;
  final List<Like>? likes;
  final int? totalCount;
  final Map<String, PostUser>? users;

  GetPostLikesResponse({
    required this.success,
    this.errorMessage,
    this.likes,
    this.totalCount,
    this.users,
  });

  factory GetPostLikesResponse.fromEntity(GetPostLikesResponseEntity entity) {
    return GetPostLikesResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      likes: entity.likes != null
          ? entity.likes!.map((e) => Like.fromEntity(e)).toList()
          : null,
      totalCount: entity.totalCount,
      users: entity.users?.map((key, value) {
        return MapEntry(key, PostUser.fromEntity(entity: value));
      }),
    );
  }

  GetPostLikesResponseEntity toEntity() {
    return GetPostLikesResponseEntity(
      success: success,
      errorMessage: errorMessage,
      likes: likes != null ? likes!.map((e) => e.toEntity()).toList() : null,
      totalCount: totalCount,
      users: users?.map((key, value) {
        return MapEntry(key, value.toEntity());
      }),
    );
  }
}

@JsonSerializable()
class GetPostLikesResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<LikeEntity>? likes;
  @JsonKey(name: 'total_count')
  final int? totalCount;
  final Map<String, PostUserEntity>? users;

  GetPostLikesResponseEntity({
    required this.success,
    this.errorMessage,
    this.likes,
    this.totalCount,
    this.users,
  });

  factory GetPostLikesResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetPostLikesResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetPostLikesResponseEntityToJson(this);
}
