import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'add_comment_reply_response.g.dart';

class AddCommentReplyResponse {
  final bool success;
  final String? errorMessage;
  final CommentReply? reply;

  AddCommentReplyResponse({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory AddCommentReplyResponse.fromEntity(
      AddCommentReplyResponseEntity entity) {
    return AddCommentReplyResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply,
    );
  }
}

@JsonSerializable()
class AddCommentReplyResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final CommentReply? reply;

  AddCommentReplyResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory AddCommentReplyResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddCommentReplyResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddCommentReplyResponseEntityToJson(this);
}
