// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserEntity _$InitiateUserEntityFromJson(Map<String, dynamic> json) =>
    InitiateUserEntity(
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      community:
          CommunityEntity.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InitiateUserEntityToJson(InitiateUserEntity instance) =>
    <String, dynamic>{
      'user': instance.user,
      'community': instance.community,
    };
