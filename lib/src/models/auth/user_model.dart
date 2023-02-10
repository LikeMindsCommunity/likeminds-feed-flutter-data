import 'package:likeminds_feed/src/models/sdk/sdk_client_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'is_guest')
  final bool isGuest;

  @JsonKey(name: 'user_unique_id')
  final String userUniqueId;

  @JsonKey(name: 'organisation_name')
  final String? organisationName;

  @JsonKey(name: 'sdk_client_info')
  final SDKClientInfo? sdkClientInfo;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @JsonKey(name: 'is_owner')
  final bool? isOwner;

  @JsonKey(name: 'custom_title')
  final String? customTitle;

  @JsonKey(name: 'member_since')
  final String? memberSince;

  @JsonKey(name: 'route')
  final String? route;

  @JsonKey(name: 'state')
  final int? state;

  @JsonKey(name: 'community_id')
  final int? communityId;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isGuest,
    required this.userUniqueId,
    this.organisationName,
    this.sdkClientInfo,
    this.updatedAt,
    this.isOwner,
    this.customTitle,
    this.memberSince,
    this.route,
    this.state,
    this.communityId,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
