// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserResponseEntity _$InitiateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    InitiateUserResponseEntity(
      success: json['success'] as bool,
      appAccess: json['data']['app_access'] as bool?,
      user: json['data']['user'] == null
          ? null
          : UserEntity.fromJson(json['data']['user'] as Map<String, dynamic>),
      community: json['data']['community'] == null
          ? null
          : CommunityEntity.fromJson(
              json['data']['community'] as Map<String, dynamic>),
      logoutResponse: json['data']['logout_response'] == null
          ? null
          : LogoutResponseEntity.fromJson(
              json['data']['logout_response'] as Map<String, dynamic>),
      accessToken: json['data']['access_token'] as String?,
      refreshToken: json['data']['refresh_token'] as String?,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$InitiateUserResponseEntityToJson(
        InitiateUserResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': {
        'app_access': instance.appAccess,
        'user': instance.user?.toJson(),
        'community': instance.community?.toJson(),
        'logout_response': instance.logoutResponse?.toJson(),
        'access_token': instance.accessToken,
        'refresh_token': instance.refreshToken,
      },
      'error_message': instance.errorMessage,
    };
