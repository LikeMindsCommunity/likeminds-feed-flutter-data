import 'package:feed_sdk/src/models/sdk/sdk_client_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'is_guest')
  final bool isGuest;

  @JsonKey(name: 'organisation_name')
  final String? organisationName;

  @JsonKey(name: 'sdk_client_info')
  final SDKClientInfo? sdkClientInfo;

  @JsonKey(name: 'updated_at')
  final double updatedAt;

  @JsonKey(name: 'user_unique_id')
  final String userUniqueId;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isGuest,
    this.organisationName,
    this.sdkClientInfo,
    required this.updatedAt,
    required this.userUniqueId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
