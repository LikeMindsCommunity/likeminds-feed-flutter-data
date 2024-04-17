// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateUserResponseEntity _$ValidateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ValidateUserResponseEntity(
      success: json["success"] as bool,
      errorMessage: json["errorMessage"] as String?,
      appAccess: json["data"]['app_access'] as bool?,
      user: json["data"]['user'] != null
          ? UserEntity.fromJson(json["data"]['user'] as Map<String, dynamic>)
          : null,
      community: json["data"]['community'] != null
          ? CommunityEntity.fromJson(
              json["data"]['community'] as Map<String, dynamic>)
          : null,
    );

Map<String, dynamic> _$ValidateUserResponseEntityToJson(
        ValidateUserResponseEntity instance) =>
    <String, dynamic>{
      "success": instance.success,
      "errorMessage": instance.errorMessage,
      "data": {
        'user': instance.user?.toJson(),
        'community': instance.community?.toJson(),
        'app_access': instance.appAccess,
      }
    };
