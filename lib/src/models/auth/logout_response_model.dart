import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

class LogoutResponse {
  final bool success;
  final String? errorMessage;

  LogoutResponse({
    required this.success,
    this.errorMessage,
  });

  factory LogoutResponse.fromEntity(LogoutResponseEntity entity) {
    return LogoutResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  toEntity() {
    return LogoutResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class LogoutResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  LogoutResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory LogoutResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseEntityToJson(this);
}
