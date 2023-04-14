// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_delete_reason_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeleteReasonResponseEntity _$GetDeleteReasonResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetDeleteReasonResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      reportTags: (json['data']['report_tags'] as List<dynamic>?)
          ?.map((e) => DeleteReasonEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDeleteReasonResponseEntityToJson(
        GetDeleteReasonResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'report_tags': instance.reportTags,
    };
