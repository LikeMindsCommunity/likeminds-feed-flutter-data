import 'package:json_annotation/json_annotation.dart';

part 'add_comment_reply_response.g.dart';

class AddCommentReplyResponse {
  final bool success;
  final String? errorMessage;

  AddCommentReplyResponse({
    required this.success,
    this.errorMessage,
  });

  factory AddCommentReplyResponse.fromEntity(
      AddCommentReplyResponseEntity entity) {
    return AddCommentReplyResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }
}

@JsonSerializable()
class AddCommentReplyResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  AddCommentReplyResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory AddCommentReplyResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddCommentReplyResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddCommentReplyResponseEntityToJson(this);
}
