import 'package:json_annotation/json_annotation.dart';

part 'get_post_request_model.g.dart';

class GetPostRequest {
  final String postId;
  final int page;
  final int pageSize;

  GetPostRequest({
    required this.postId,
    required this.page,
    required this.pageSize,
  });

  factory GetPostRequest.fromEntity({required GetPostRequestEntity entity}) {
    return GetPostRequest(
      postId: entity.postId,
      page: entity.page,
      pageSize: entity.pageSize,
    );
  }

  GetPostRequestEntity toEntity() {
    return GetPostRequestEntity(
      postId: postId,
      page: page,
      pageSize: pageSize,
    );
  }
}

@JsonSerializable()
class GetPostRequestEntity {
  @JsonKey(name: 'post_id')
  final String postId;
  final int page;
  @JsonKey(name: 'page_size')
  final int pageSize;

  GetPostRequestEntity({
    required this.postId,
    required this.page,
    required this.pageSize,
  });

  factory GetPostRequestEntity.fromJson(Map<String, dynamic> data) =>
      _$GetPostRequestEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetPostRequestEntityToJson(this);
}
