import 'package:json_annotation/json_annotation.dart';

part 'community_settings.g.dart';

class CommunitySettings {
  final bool enabled;
  final int enabledBy;
  final String settingSubTitle;
  final String settingTitle;
  final String settingType;

  CommunitySettings({
    required this.enabled,
    required this.enabledBy,
    required this.settingSubTitle,
    required this.settingTitle,
    required this.settingType,
  });

  factory CommunitySettings.fromEntity(CommunitySettingsEntity entity) {
    return CommunitySettings(
      enabled: entity.enabled,
      enabledBy: entity.enabledBy,
      settingSubTitle: entity.settingSubTitle,
      settingTitle: entity.settingTitle,
      settingType: entity.settingType,
    );
  }

  CommunitySettingsEntity toEntity() {
    return CommunitySettingsEntity(
      enabled: enabled,
      enabledBy: enabledBy,
      settingSubTitle: settingSubTitle,
      settingTitle: settingTitle,
      settingType: settingType,
    );
  }
}

@JsonSerializable()
class CommunitySettingsEntity {
  final bool enabled;
  @JsonKey(name: 'enabled_by')
  final int enabledBy;

  @JsonKey(name: 'setting_sub_title')
  final String settingSubTitle;

  @JsonKey(name: 'setting_title')
  final String settingTitle;

  @JsonKey(name: 'setting_type')
  final String settingType;

  CommunitySettingsEntity({
    required this.enabled,
    required this.enabledBy,
    required this.settingSubTitle,
    required this.settingTitle,
    required this.settingType,
  });

  factory CommunitySettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunitySettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunitySettingsEntityToJson(this);
}
