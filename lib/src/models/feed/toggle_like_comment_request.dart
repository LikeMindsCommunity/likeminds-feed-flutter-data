import 'package:json_annotation/json_annotation.dart';
part 'toggle_like_comment_request.g.dart';

@JsonSerializable()
class ToggleLikeCommentRequest {
  final String postId;
  final String commentId;
  // final int pageSize;

  ToggleLikeCommentRequest({
    required this.postId,
    required this.commentId,
  });

  factory ToggleLikeCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleLikeCommentRequestToJson(this);
}
