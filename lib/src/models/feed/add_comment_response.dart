import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'add_comment_response.g.dart';

class AddCommentResponse {
  final bool success;
  final String? errorMessage;
  final Comment? reply;

  AddCommentResponse({required this.success, this.errorMessage, this.reply});

  factory AddCommentResponse.fromEntity(AddCommentResponseEntity entity) {
    return AddCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply,
    );
  }
}

@JsonSerializable()
class AddCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final Comment? reply;

  AddCommentResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
  });

  factory AddCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddCommentResponseEntityToJson(this);
}
