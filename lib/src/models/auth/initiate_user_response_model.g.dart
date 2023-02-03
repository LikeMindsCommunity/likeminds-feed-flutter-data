// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserResponse _$InitiateUserResponseFromJson(
        Map<String, dynamic> json) =>
    InitiateUserResponse(
      success: json['success'] as bool,
      data: json['data'] as Map<String, dynamic>?,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$InitiateUserResponseToJson(
        InitiateUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error_message': instance.errorMessage,
    };
