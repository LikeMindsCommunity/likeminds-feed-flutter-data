import 'package:json_annotation/json_annotation.dart';

part 'toggle_like_comment_response.g.dart';

class ToggleLikeCommentResponse {
  final bool success;
  final String? errorMessage;

  ToggleLikeCommentResponse({
    required this.success,
    this.errorMessage,
  });

  factory ToggleLikeCommentResponse.fromEntity(
      ToggleLikeCommentResponseEntity entity) {
    return ToggleLikeCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }
}

@JsonSerializable()
class ToggleLikeCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  ToggleLikeCommentResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory ToggleLikeCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$ToggleLikeCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() =>
      _$ToggleLikeCommentResponseEntityToJson(this);
}
