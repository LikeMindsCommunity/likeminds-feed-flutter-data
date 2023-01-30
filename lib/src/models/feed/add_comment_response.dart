import 'package:json_annotation/json_annotation.dart';

part 'add_comment_response.g.dart';

class AddCommentResponse {
  final bool success;
  final String? errorMessage;

  AddCommentResponse({
    required this.success,
    this.errorMessage,
  });

  factory AddCommentResponse.fromEntity(AddCommentResponseEntity entity) {
    return AddCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }
}

@JsonSerializable()
class AddCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  AddCommentResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory AddCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddCommentResponseEntityToJson(this);
}
