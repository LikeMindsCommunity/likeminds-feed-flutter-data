// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceRequestEntity _$RegisterDeviceRequestEntityFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceRequestEntity(
      token: json['token'] as String,
      deviceId: json['device_id'] as String,
      memberId: json['x-member_id'] as int,
    );

Map<String, dynamic> _$RegisterDeviceRequestEntityToJson(
        RegisterDeviceRequestEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'device_id': instance.deviceId,
      'x-member_id': instance.memberId,
    };
