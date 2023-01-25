// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_client_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SDKClientInfo _$SDKClientInfoFromJson(Map<String, dynamic> json) =>
    SDKClientInfo(
      community: json['community'] as String,
      user: json['user'] as String,
      userUniqueId: json['user_unique_id'] as String,
    );

Map<String, dynamic> _$SDKClientInfoToJson(SDKClientInfo instance) =>
    <String, dynamic>{
      'community': instance.community,
      'user': instance.user,
      'user_unique_id': instance.userUniqueId,
    };
