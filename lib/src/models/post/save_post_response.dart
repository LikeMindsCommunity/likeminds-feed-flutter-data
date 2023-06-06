import 'package:json_annotation/json_annotation.dart';

part 'save_post_response_model.g.dart';

class SavePostResponse {
  final bool success;
  final String? errorMessage;

  SavePostResponse({
    required this.success,
    this.errorMessage,
  });

  factory SavePostResponse.fromEntity(SavePostResponseEntity entity) {
    return SavePostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  SavePostResponseEntity toEntity() {
    return SavePostResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class SavePostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  SavePostResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory SavePostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SavePostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SavePostResponseEntityToJson(this);
}
