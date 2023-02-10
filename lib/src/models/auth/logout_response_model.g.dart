// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseEntity _$LogoutResponseEntityFromJson(
        Map<String, dynamic> json) =>
    LogoutResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$LogoutResponseEntityToJson(
        LogoutResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
