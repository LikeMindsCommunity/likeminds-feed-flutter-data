import 'package:json_annotation/json_annotation.dart';

part 'delete_post_response_model.g.dart';

class DeletePostResponse {
  final bool success;
  final String? errorMessage;

  DeletePostResponse({required this.success, required this.errorMessage});

  factory DeletePostResponse.fromEntity(DeletePostResponseEntity entity) {
    return DeletePostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }
}

@JsonSerializable()
class DeletePostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  DeletePostResponseEntity({required this.success, required this.errorMessage});

  factory DeletePostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DeletePostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeletePostResponseEntityToJson(this);
}
