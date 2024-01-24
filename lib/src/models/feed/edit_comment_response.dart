import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'edit_comment_response.g.dart';

class EditCommentResponse {
  final bool success;
  final String? errorMessage;
  final Comment? reply;

  EditCommentResponse({required this.success, this.errorMessage, this.reply});

  factory EditCommentResponse.fromEntity(EditCommentResponseEntity entity) {
    return EditCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply,
    );
  }
}

@JsonSerializable()
class EditCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final Comment? reply;

  EditCommentResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory EditCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$EditCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$EditCommentResponseEntityToJson(this);
}
