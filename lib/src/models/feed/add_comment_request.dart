// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'add_comment_request.g.dart';

@JsonSerializable()
class AddCommentRequest {
  final String text;
  final String postId;
  AddCommentRequest({required this.text, required this.postId});
  factory AddCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentRequestToJson(this);
}
