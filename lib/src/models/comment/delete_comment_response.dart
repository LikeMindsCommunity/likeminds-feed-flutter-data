import 'package:json_annotation/json_annotation.dart';

part 'delete_comment_response.g.dart';

class DeleteCommentResponse {
  final bool success;
  final String? errorMessage;

  DeleteCommentResponse({
    required this.success,
    this.errorMessage,
  });

  factory DeleteCommentResponse.fromEntity(DeleteCommentResponseEntity entity) {
    return DeleteCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  DeleteCommentResponseEntity toEntity() {
    return DeleteCommentResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class DeleteCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  DeleteCommentResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory DeleteCommentResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCommentResponseEntityToJson(this);
}
