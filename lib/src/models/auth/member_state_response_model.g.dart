// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_state_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberStateResponseEntity _$MemberStateResponseEntityFromJson(
        Map<String, dynamic> json) =>
    MemberStateResponseEntity(
      success: json['success'] as bool,
      createdAt: json['data']['created_at'] as String?,
      editRequired: json['data']['edit_required'] as bool?,
      member: json['data']['member'] == null
          ? null
          : UserEntity.fromJson(json['data']['member'] as Map<String, dynamic>),
      memberRights: (json['data']['member_rights'] as List<dynamic>)
          .map((e) => MemberRight.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['data']['state'] as int?,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$MemberStateResponseEntityToJson(
        MemberStateResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': {
        'created_at': instance.createdAt,
        'edit_required': instance.editRequired,
        'member': instance.member?.toJson(),
        'state': instance.state,
        'member_rights': instance.memberRights?.map((e) => e.toJson()).toList(),
      }
    };
