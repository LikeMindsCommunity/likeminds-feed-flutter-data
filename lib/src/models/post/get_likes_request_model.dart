import 'package:json_annotation/json_annotation.dart';

part 'get_likes_request_model.g.dart';

class GetPostLikesRequest {
  final String postId;
  final int? page;
  final int? pageSize;

  GetPostLikesRequest({
    required this.postId,
    this.page,
    this.pageSize,
  });

  factory GetPostLikesRequest.fromEntity(GetPostLikesRequestEntity entity) {
    return GetPostLikesRequest(
      postId: entity.postId,
      page: entity.page,
      pageSize: entity.pageSize,
    );
  }

  GetPostLikesRequestEntity toEntity() {
    return GetPostLikesRequestEntity(
      postId: postId,
      page: page,
      pageSize: pageSize,
    );
  }
}

@JsonSerializable()
class GetPostLikesRequestEntity {
  @JsonKey(name: 'post_id')
  final String postId;
  final int? page;
  @JsonKey(name: 'page_size')
  final int? pageSize;

  GetPostLikesRequestEntity({
    required this.postId,
    this.page,
    this.pageSize,
  });

  factory GetPostLikesRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPostLikesRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostLikesRequestEntityToJson(this);
}
