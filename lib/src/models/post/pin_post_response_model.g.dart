// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinPostResponseEntity _$PinPostResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PinPostResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$PinPostResponseEntityToJson(
        PinPostResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
