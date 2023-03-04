import 'package:json_annotation/json_annotation.dart';

part 'like_post_request_model.g.dart';

class LikePostRequest {
  final String postId;

  LikePostRequest({
    required this.postId,
  });

  factory LikePostRequest.fromEntity(LikePostRequestEntity entity) {
    return LikePostRequest(
      postId: entity.postId,
    );
  }

  LikePostRequestEntity toEntity() {
    return LikePostRequestEntity(
      postId: postId,
    );
  }

  get getPostId => postId;
}

@JsonSerializable()
class LikePostRequestEntity {
  @JsonKey(name: 'post_id')
  final String postId;

  LikePostRequestEntity({
    required this.postId,
  });

  factory LikePostRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$LikePostRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LikePostRequestEntityToJson(this);
}
