import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'edit_comment_reply_response.g.dart';

class EditCommentReplyResponse {
  final bool success;
  final String? errorMessage;
  final CommentReply? reply;

  EditCommentReplyResponse({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory EditCommentReplyResponse.fromEntity(
      EditCommentReplyResponseEntity entity) {
    return EditCommentReplyResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply,
    );
  }
}

@JsonSerializable()
class EditCommentReplyResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final CommentReply? reply;

  EditCommentReplyResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory EditCommentReplyResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$EditCommentReplyResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$EditCommentReplyResponseEntityToJson(this);
}
