import 'package:likeminds_feed/src/models/sdk/sdk_client_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isGuest;
  final String userUniqueId;
  final String? organisationName;
  final SDKClientInfo? sdkClientInfo;
  final int? updatedAt;
  final bool? isOwner;
  final String? customTitle;
  final String? memberSince;
  final String? route;
  final int? state;
  final int? communityId;
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

  factory User.fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      isGuest: entity.isGuest,
      userUniqueId: entity.userUniqueId,
      organisationName: entity.organisationName,
      sdkClientInfo: entity.sdkClientInfo,
      updatedAt: entity.updatedAt,
      isOwner: entity.isOwner,
      customTitle: entity.customTitle,
      memberSince: entity.memberSince,
      route: entity.route,
      state: entity.state,
      communityId: entity.communityId,
      createdAt: entity.createdAt,
    );
  }

  toEntity() {
    return UserEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isGuest: isGuest,
      userUniqueId: userUniqueId,
      organisationName: organisationName,
      sdkClientInfo: sdkClientInfo,
      updatedAt: updatedAt,
      isOwner: isOwner,
      customTitle: customTitle,
      memberSince: memberSince,
      route: route,
      state: state,
      communityId: communityId,
      createdAt: createdAt,
    );
  }
}

@JsonSerializable()
class UserEntity {
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

  UserEntity({
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

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
