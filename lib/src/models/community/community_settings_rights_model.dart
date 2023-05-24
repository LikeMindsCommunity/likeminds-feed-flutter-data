import 'package:json_annotation/json_annotation.dart';

part 'community_settings_rights_model.g.dart';

class CommunitySettingsRights {
  final int id;
  final int state;
  final String title;
  final String? subtitle;
  final bool isLocked;
  final bool isSelected;

  CommunitySettingsRights({
    required this.id,
    required this.state,
    required this.title,
    this.subtitle,
    required this.isLocked,
    required this.isSelected,
  });

  factory CommunitySettingsRights.fromEntity(
      CommunitySettingsRightsEntity entity) {
    return CommunitySettingsRights(
      id: entity.id,
      state: entity.state,
      title: entity.title,
      subtitle: entity.subtitle,
      isLocked: entity.isLocked,
      isSelected: entity.isSelected,
    );
  }

  CommunitySettingsRightsEntity toEntity() {
    return CommunitySettingsRightsEntity(
      id: id,
      state: state,
      title: title,
      subtitle: subtitle,
      isLocked: isLocked,
      isSelected: isSelected,
    );
  }
}

@JsonSerializable()
class CommunitySettingsRightsEntity {
  final int id;
  final int state;
  final String title;

  @JsonKey(name: 'sub_title')
  final String? subtitle;

  @JsonKey(name: 'is_locked')
  final bool isLocked;

  @JsonKey(name: 'is_selected')
  final bool isSelected;

  CommunitySettingsRightsEntity({
    required this.id,
    required this.state,
    required this.title,
    this.subtitle,
    required this.isLocked,
    required this.isSelected,
  });

  factory CommunitySettingsRightsEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunitySettingsRightsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunitySettingsRightsEntityToJson(this);
}
