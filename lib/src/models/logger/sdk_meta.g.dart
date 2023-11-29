// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LMSDKMeta _$LMSDKMetaFromJson(Map<String, dynamic> json) => LMSDKMeta(
      sampleAppVersion: json['sample_app_version'] as String?,
      uiVersion: json['ui_version'] as String?,
      middlewareVersion: json['middleware_version'] as String?,
    );

Map<String, dynamic> _$LMSDKMetaToJson(LMSDKMeta instance) => <String, dynamic>{
      'sample_app_version': instance.sampleAppVersion,
      'ui_version': instance.uiVersion,
      'middleware_version': instance.middlewareVersion,
    };
