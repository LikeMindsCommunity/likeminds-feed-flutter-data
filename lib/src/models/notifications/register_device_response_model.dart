import 'package:json_annotation/json_annotation.dart';

part 'register_device_response_model.g.dart';

class RegisterDeviceResponse {
  final String? errorMessage;
  final bool success;

  RegisterDeviceResponse({
    required this.errorMessage,
    required this.success,
  });

  factory RegisterDeviceResponse.fromEntity(
      RegisterDeviceResponseEntity entity) {
    return RegisterDeviceResponse(
      errorMessage: entity.errorMessage,
      success: entity.success,
    );
  }

  RegisterDeviceResponseEntity toEntity() {
    return RegisterDeviceResponseEntity(
      errorMessage: errorMessage,
      success: success,
    );
  }

  @override
  String toString() => "Register response - $success\n error - $errorMessage";
}

@JsonSerializable()
class RegisterDeviceResponseEntity {
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final bool success;

  RegisterDeviceResponseEntity({
    required this.errorMessage,
    required this.success,
  });

  factory RegisterDeviceResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceResponseEntityToJson(this);
}
