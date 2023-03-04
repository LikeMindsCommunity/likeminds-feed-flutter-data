import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/methods/utils.dart';

part 'branding_advanced_model.g.dart';

class BrandingAdvanced {
  final Color? headerColor;
  final Color? buttonIconsColor;
  final Color? textLinksColor;

  BrandingAdvanced({
    this.buttonIconsColor,
    this.headerColor,
    this.textLinksColor,
  });

  factory BrandingAdvanced.fromEntity(BrandingAdvancedEntity entity) {
    return BrandingAdvanced(
        buttonIconsColor: entity.buttonIconsColor?.toColor(),
        headerColor: entity.headerColor?.toColor(),
        textLinksColor: entity.textLinksColor?.toColor());
  }

  BrandingAdvancedEntity toEntity() {
    return BrandingAdvancedEntity(
        headerColor: headerColor?.value.toString(),
        buttonIconsColor: buttonIconsColor?.value.toString(),
        textLinksColor: textLinksColor?.value.toString());
  }
}

@JsonSerializable()
class BrandingAdvancedEntity {
  @JsonKey(name: 'header_colour')
  final String? headerColor;

  @JsonKey(name: 'button_icons_colour')
  final String? buttonIconsColor;

  @JsonKey(name: 'text_links_colour')
  final String? textLinksColor;

  BrandingAdvancedEntity({
    this.headerColor,
    this.buttonIconsColor,
    this.textLinksColor,
  });

  Map<String, dynamic> toJson() => _$BrandingAdvancedEntityToJson(this);

  factory BrandingAdvancedEntity.fromJson(Map<String, dynamic> data) =>
      _$BrandingAdvancedEntityFromJson(data);
}
