import 'package:json_annotation/json_annotation.dart';

part 'delete_post_request_model.g.dart';

class DeletePostRequest {
  final String postId;
  final String deleteReason;

  DeletePostRequest({
    required this.postId,
    required this.deleteReason,
  });

  factory DeletePostRequest.fromEntity(DeletePostRequestEntity entity) {
    return DeletePostRequest(
      postId: entity.postId,
      deleteReason: entity.deleteReason,
    );
  }

  DeletePostRequestEntity toEntity() {
    return DeletePostRequestEntity(
      postId: postId,
      deleteReason: deleteReason,
    );
  }
}

@JsonSerializable()
class DeletePostRequestEntity {
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'delete_reason')
  final String deleteReason;

  DeletePostRequestEntity({
    required this.postId,
    required this.deleteReason,
  });

  factory DeletePostRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$DeletePostRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeletePostRequestEntityToJson(this);
}
