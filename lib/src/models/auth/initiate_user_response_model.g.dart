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
      initiateUser: json['data']['community'] == null
          ? null
          : InitiateUserEntity.fromJson(json['data'] as Map<String, dynamic>),
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
      'app_access': instance.appAccess,
      'initiate_user': instance.initiateUser,
      'logout_response': instance.logoutResponse,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'error_message': instance.errorMessage,
    };
