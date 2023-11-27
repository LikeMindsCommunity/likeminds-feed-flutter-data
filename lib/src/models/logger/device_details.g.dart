// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDetails _$DeviceDetailsFromJson(Map<String, dynamic> json) =>
    DeviceDetails(
      os: json['os'] as String,
      versionOS: json['version_os'] as String,
      deviceName: json['device_name'] as String,
      screenHeight: json['screen_height'] as int,
      screenWidth: json['screen_width'] as int,
      wifi: json['wifi'] as bool,
    );

Map<String, dynamic> _$DeviceDetailsToJson(DeviceDetails instance) =>
    <String, dynamic>{
      'os': instance.os,
      'version_os': instance.versionOS,
      'device_name': instance.deviceName,
      'screen_height': instance.screenHeight,
      'screen_width': instance.screenWidth,
      'wifi': instance.wifi,
    };
