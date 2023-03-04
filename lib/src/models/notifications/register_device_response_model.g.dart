// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceResponseEntity _$RegisterDeviceResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceResponseEntity(
      errorMessage: json['error_message'] as String?,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$RegisterDeviceResponseEntityToJson(
        RegisterDeviceResponseEntity instance) =>
    <String, dynamic>{
      'error_message': instance.errorMessage,
      'success': instance.success,
    };
