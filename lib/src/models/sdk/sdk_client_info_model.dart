import 'package:json_annotation/json_annotation.dart';

part 'sdk_client_info_model.g.dart';

@JsonSerializable()
class SDKClientInfo {
  final int community;
  final int user;

  @JsonKey(name: 'uuid')
  final String uuid;

  SDKClientInfo({
    required this.community,
    required this.user,
    required this.uuid,
  });

  factory SDKClientInfo.fromJson(Map<String, dynamic> json) =>
      _$SDKClientInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SDKClientInfoToJson(this);
}
