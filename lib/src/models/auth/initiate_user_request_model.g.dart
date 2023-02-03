// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserRequest _$InitiateUserRequestFromJson(Map<String, dynamic> json) =>
    InitiateUserRequest(
      userName: json['user_name'] as String?,
      userId: json['user_unique_id'] as String?,
      isGuest: json['is_guest'] as bool?,
      imageUrl: json['image_url'] as String?,
      apiKey: json['x-api-key'] as String?,
    );

Map<String, dynamic> _$InitiateUserRequestToJson(
        InitiateUserRequest instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_unique_id': instance.userId,
      'is_guest': instance.isGuest,
      'image_url': instance.imageUrl,
      'x-api-key': instance.apiKey,
    };
