import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'branding_model.g.dart';

class Branding {
  final BrandingBasic? basic;
  final BrandingAdvanced? advanced;

  Branding({this.basic, this.advanced});

  factory Branding.fromEntity(BrandingEntity entity) {
    return Branding(
        basic: entity.basic != null
            ? BrandingBasic.fromEntity(entity.basic!)
            : null,
        advanced: entity.advanced != null
            ? BrandingAdvanced.fromEntity(entity.advanced!)
            : null);
  }

  BrandingEntity toEntity() {
    return BrandingEntity(
      basic: basic?.toEntity(),
      advanced: advanced?.toEntity(),
    );
  }

  @override
  String toString() => 'Branding model (basic: $basic, advanced: $advanced)';
}

@JsonSerializable(explicitToJson: true)
class BrandingEntity {
  @JsonKey(name: 'basic')
  final BrandingBasicEntity? basic;

  @JsonKey(name: 'advanced')
  final BrandingAdvancedEntity? advanced;

  BrandingEntity({this.basic, this.advanced});

  Map<String, dynamic> toJson() => _$BrandingEntityToJson(this);

  factory BrandingEntity.fromJson(Map<String, dynamic> data) =>
      _$BrandingEntityFromJson(data);
}
