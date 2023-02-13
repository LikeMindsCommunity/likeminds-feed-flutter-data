// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandingRequestEntity _$BrandingRequestEntityFromJson(
        Map<String, dynamic> json) =>
    BrandingRequestEntity(
      communityId: json['community_id'] as String,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$BrandingRequestEntityToJson(
        BrandingRequestEntity instance) =>
    <String, dynamic>{
      'community_id': instance.communityId,
      'user_id': instance.userId,
    };
