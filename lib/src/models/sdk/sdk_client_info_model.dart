import 'package:json_annotation/json_annotation.dart';

part 'sdk_client_info_model.g.dart';

@JsonSerializable()
class SDKClientInfo {
  final String community;
  final String user;

  @JsonKey(name: 'user_unique_id')
  final String userUniqueId;

  SDKClientInfo({
    required this.community,
    required this.user,
    required this.userUniqueId,
  });

  factory SDKClientInfo.fromJson(Map<String, dynamic> json) =>
      _$SDKClientInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SDKClientInfoToJson(this);
}
