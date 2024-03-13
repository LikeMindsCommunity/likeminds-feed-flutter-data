import 'package:json_annotation/json_annotation.dart';

part 'sdk_client_info_model.g.dart';

class SDKClientInfo {
  final int community;
  final int user;
  final String? widgetId;
  final String uuid;

  SDKClientInfo({
    required this.community,
    required this.user,
    this.widgetId,
    required this.uuid,
  });

  factory SDKClientInfo.fromEntity(SDKClientInfoEntity entity) {
    return SDKClientInfo(
      community: entity.community,
      user: entity.user,
      widgetId: entity.widgetId,
      uuid: entity.uuid,
    );
  }

  SDKClientInfoEntity toEntity() {
    return SDKClientInfoEntity(
      community: community,
      user: user,
      widgetId: widgetId,
      uuid: uuid,
    );
  }
}

@JsonSerializable()
class SDKClientInfoEntity {
  final int community;
  final int user;
  @JsonKey(name: 'widget_id')
  final String? widgetId;
  @JsonKey(name: 'uuid')
  final String uuid;

  SDKClientInfoEntity({
    required this.community,
    required this.user,
    this.widgetId,
    required this.uuid,
  });

  factory SDKClientInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$SDKClientInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SDKClientInfoToJson(this);
}
