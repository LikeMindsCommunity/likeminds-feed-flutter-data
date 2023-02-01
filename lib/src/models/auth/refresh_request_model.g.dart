// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshRequestEntity _$RefreshRequestEntityFromJson(
        Map<String, dynamic> json) =>
    RefreshRequestEntity(
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$RefreshRequestEntityToJson(
        RefreshRequestEntity instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };
