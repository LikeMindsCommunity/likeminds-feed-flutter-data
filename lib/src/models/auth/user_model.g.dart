// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      isGuest: json['is_guest'] as bool?,
      userUniqueId: json['user_unique_id'] as String,
      organisationName: json['organisation_name'] as String?,
      sdkClientInfo: json['sdk_client_info'] == null
          ? null
          : SDKClientInfo.fromJson(
              json['sdk_client_info'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as int?,
      isOwner: json['is_owner'] as bool?,
      customTitle: json['custom_title'] as String?,
      memberSince: json['member_since'] as String?,
      route: json['route'] as String?,
      state: json['state'] as int?,
      communityId: json['community_id'] as int?,
      createdAt: json['created_at'] as int?,
      isDeleted: json['is_deleted'] as bool?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'is_guest': instance.isGuest,
      'user_unique_id': instance.userUniqueId,
      'organisation_name': instance.organisationName,
      'sdk_client_info': instance.sdkClientInfo,
      'updated_at': instance.updatedAt,
      'is_owner': instance.isOwner,
      'custom_title': instance.customTitle,
      'member_since': instance.memberSince,
      'route': instance.route,
      'state': instance.state,
      'community_id': instance.communityId,
      'created_at': instance.createdAt,
      'is_deleted': instance.isDeleted,
    };
