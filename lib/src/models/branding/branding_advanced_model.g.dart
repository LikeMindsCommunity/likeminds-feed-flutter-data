// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding_advanced_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandingAdvancedEntity _$BrandingAdvancedEntityFromJson(
        Map<String, dynamic> json) =>
    BrandingAdvancedEntity(
      headerColor: json['header_colour'] as String?,
      buttonIconsColor: json['button_icons_colour'] as String?,
      textLinksColor: json['text_links_colour'] as String?,
    );

Map<String, dynamic> _$BrandingAdvancedEntityToJson(
        BrandingAdvancedEntity instance) =>
    <String, dynamic>{
      'header_colour': instance.headerColor,
      'button_icons_colour': instance.buttonIconsColor,
      'text_links_colour': instance.textLinksColor,
    };
