import 'package:json_annotation/json_annotation.dart';

part 'register_device_request_model.g.dart';

class RegisterDeviceRequest {
  final String token;
  final String deviceId;
  final int memberId;

  RegisterDeviceRequest({
    required this.token,
    required this.deviceId,
    required this.memberId,
  });

  factory RegisterDeviceRequest.fromEntity(RegisterDeviceRequestEntity entity) {
    return RegisterDeviceRequest(
      token: entity.token,
      deviceId: entity.deviceId,
      memberId: entity.memberId,
    );
  }

  RegisterDeviceRequestEntity toEntity() {
    return RegisterDeviceRequestEntity(
      token: token,
      deviceId: deviceId,
      memberId: memberId,
    );
  }
}

@JsonSerializable()
class RegisterDeviceRequestEntity {
  final String token;
  @JsonKey(name: 'device_id')
  final String deviceId;
  @JsonKey(name: 'x-member_id')
  final int memberId;

  RegisterDeviceRequestEntity({
    required this.token,
    required this.deviceId,
    required this.memberId,
  });

  factory RegisterDeviceRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestEntityToJson(this);
}
