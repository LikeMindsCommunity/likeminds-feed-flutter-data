import 'package:json_annotation/json_annotation.dart';

part 'delete_comment_request.g.dart';

class DeleteCommentRequest {
  final String commentId;
  final String postId;
  final String reason;

  DeleteCommentRequest({
    required this.commentId,
    required this.postId,
    required this.reason,
  });

  factory DeleteCommentRequest.fromEntity(DeleteCommentRequestEntity entity) {
    return DeleteCommentRequest(
      commentId: entity.commentId,
      postId: entity.postId,
      reason: entity.reason,
    );
  }

  DeleteCommentRequestEntity toEntity() {
    return DeleteCommentRequestEntity(
      commentId: commentId,
      postId: postId,
      reason: reason,
    );
  }
}

@JsonSerializable()
class DeleteCommentRequestEntity {
  @JsonKey(name: 'comment_id')
  final String commentId;
  @JsonKey(name: 'post_id')
  final String postId;
  final String reason;

  DeleteCommentRequestEntity({
    required this.commentId,
    required this.postId,
    required this.reason,
  });

  factory DeleteCommentRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommentRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCommentRequestEntityToJson(this);
}
