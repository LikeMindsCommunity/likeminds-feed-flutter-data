// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_client_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SDKClientInfoEntity _$SDKClientInfoFromJson(Map<String, dynamic> json) =>
    SDKClientInfoEntity(
      community: json['community'] as int,
      user: json['user'] as int,
      uuid: json['uuid'] as String,
      widgetId: (json['widget_id'] ?? json['widgetId']) as String?,
    );

Map<String, dynamic> _$SDKClientInfoToJson(SDKClientInfoEntity instance) =>
    <String, dynamic>{
      'community': instance.community,
      'user': instance.user,
      'uuid': instance.uuid,
      'widget_id': instance.widgetId,
    };
