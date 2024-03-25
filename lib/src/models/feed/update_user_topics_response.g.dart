// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_topics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserTopicsResponseEntity _$UpdateUserTopicsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    UpdateUserTopicsResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$UpdateUserTopicsResponseEntityToJson(
        UpdateUserTopicsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
    };
