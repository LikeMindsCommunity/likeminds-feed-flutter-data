// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_meta_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionMetaResponseEntity _$ConnectionMetaResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ConnectionMetaResponseEntity(
      followStatus: json['follow_status'] as bool,
      followersCount: json['followers_count'] as int,
      followingsCount: json['followings_count'] as int,
    );

Map<String, dynamic> _$ConnectionMetaResponseEntityToJson(
        ConnectionMetaResponseEntity instance) =>
    <String, dynamic>{
      'follow_status': instance.followStatus,
      'followers_count': instance.followersCount,
      'followings_count': instance.followingsCount,
    };
