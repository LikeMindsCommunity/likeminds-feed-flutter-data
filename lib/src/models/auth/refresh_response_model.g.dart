// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshResponseEntity _$RefreshResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RefreshResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      accessToken: json['data']['access_token'] as String?,
      refreshToken: json['data']['refresh_token'] as String?,
    );

Map<String, dynamic> _$RefreshResponseEntityToJson(
        RefreshResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'access_token': instance.accessToken,
        'refresh_token': instance.refreshToken,
      }
    };
