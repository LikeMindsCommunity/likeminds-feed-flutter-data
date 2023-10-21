import 'package:json_annotation/json_annotation.dart';

part 'community_configurations_model.g.dart';

class CommunityConfigurations {
  final String? description;
  final String? type;
  final Map<String, dynamic>? value;

  CommunityConfigurations({
    this.description,
    this.type,
    this.value,
  });

  factory CommunityConfigurations.fromEntity(
      CommunityConfigurationsEntity entity) {
    return CommunityConfigurations(
      description: entity.description,
      type: entity.type,
      value: entity.value,
    );
  }

  CommunityConfigurationsEntity toEntity() {
    return CommunityConfigurationsEntity(
      description: description,
      type: type,
      value: value,
    );
  }
}

@JsonSerializable()
class CommunityConfigurationsEntity {
  final String? description;
  final String? type;
  final Map<String, dynamic>? value;

  CommunityConfigurationsEntity({
    this.description,
    this.type,
    this.value,
  });

  factory CommunityConfigurationsEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunityConfigurationsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityConfigurationsEntityToJson(this);
}
