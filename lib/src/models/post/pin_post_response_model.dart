import 'package:json_annotation/json_annotation.dart';

part 'pin_post_response_model.g.dart';

class PinPostResponse {
  final bool success;
  final String? errorMessage;

  PinPostResponse({
    required this.success,
    this.errorMessage,
  });

  factory PinPostResponse.fromEntity(PinPostResponseEntity entity) {
    return PinPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  PinPostResponseEntity toEntity() {
    return PinPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class PinPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  PinPostResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory PinPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PinPostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PinPostResponseEntityToJson(this);
}
