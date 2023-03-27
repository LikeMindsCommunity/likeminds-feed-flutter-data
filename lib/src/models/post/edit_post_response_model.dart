import 'package:json_annotation/json_annotation.dart';

part 'edit_post_response_model.g.dart';

class EditPostResponse {
  final bool success;
  final String? errorMessage;

  EditPostResponse({
    required this.success,
    this.errorMessage,
  });

  factory EditPostResponse.fromEntity(EditPostResponseEntity entity) {
    return EditPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  EditPostResponseEntity toEntity() {
    return EditPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class EditPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  EditPostResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory EditPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditPostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditPostResponseEntityToJson(this);
}
