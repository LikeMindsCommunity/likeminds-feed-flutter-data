import 'package:json_annotation/json_annotation.dart';

part 'comment_detail_request.g.dart';

@JsonSerializable()
class CommentDetailRequest {
  final String commentId;
  final String postId;
  final int page;
  // final int pageSize;

  CommentDetailRequest(
      {required this.commentId, required this.page, required this.postId});

  factory CommentDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDetailRequestToJson(this);
}
