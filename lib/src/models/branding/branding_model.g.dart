// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandingEntity _$BrandingEntityFromJson(Map<String, dynamic> json) =>
    BrandingEntity(
      basic: json['basic'] == null
          ? null
          : BrandingBasicEntity.fromJson(json['basic'] as Map<String, dynamic>),
      advanced: json['advanced'] == null
          ? null
          : BrandingAdvancedEntity.fromJson(
              json['advanced'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrandingEntityToJson(BrandingEntity instance) =>
    <String, dynamic>{
      'basic': instance.basic?.toJson(),
      'advanced': instance.advanced?.toJson(),
    };
