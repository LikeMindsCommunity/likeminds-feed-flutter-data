// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'add_comment_reply_request.g.dart';

@JsonSerializable()
class AddCommentReplyRequest {
  final String text;
  final String postId;
  final String commentId;
  AddCommentReplyRequest(
      {required this.text, required this.postId, required this.commentId});
  factory AddCommentReplyRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCommentReplyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentReplyRequestToJson(this);
}
