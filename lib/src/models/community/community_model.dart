import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'community_model.g.dart';

class Community {
  final int id;
  final String name;
  final String? imageUrl;
  final String? purpose;
  final String? about;
  final Branding? branding;
  final int? membersCount;
  final bool? isMember;
  final int? pendingMembersCount;
  final int? pendingChatRoomCount;
  final int? openReportsCount;
  final int? chatroomUnseen;
  final int? updatedAt;
  final bool? isAdmin;
  final int? state;
  final int? memberState;
  final String? createdBy;
  final String? managedBy;
  final String? date;
  final int? type;
  final int? subType;
  final int? clickState;
  final int? chatroomCount;
  final List<dynamic>? actions;
  final List<User>? newChatRoomUsers;
  final List<User>? chatRoomUsers;
  final List<int>? memberRightStates;
  final int? orderTime;
  final List<String>? menu;
  final dynamic leaveCommunity;
  final bool? isPaid;
  final bool? autoApproval;
  final int? gracePeriod;
  final bool? isDiscoverable;
  final String? websiteUrl;
  final bool? referralEnabled;
  final List<CommunitySettingsRights>? communitySettingRights;
  final String? likeMindsPlan;
  final bool? isFreemiumCommunity;

  Community({
    required this.id,
    required this.name,
    this.imageUrl,
    this.purpose,
    this.about,
    this.branding,
    this.membersCount,
    this.isMember,
    this.pendingMembersCount,
    this.pendingChatRoomCount,
    this.openReportsCount,
    this.chatroomUnseen,
    this.updatedAt,
    this.isAdmin,
    this.state,
    this.memberState,
    this.createdBy,
    this.managedBy,
    this.date,
    this.type,
    this.subType,
    this.clickState,
    this.chatroomCount,
    this.actions,
    this.newChatRoomUsers,
    this.chatRoomUsers,
    this.memberRightStates,
    this.orderTime,
    this.menu,
    this.leaveCommunity,
    this.isPaid,
    this.autoApproval,
    this.gracePeriod,
    this.isDiscoverable,
    this.websiteUrl,
    this.referralEnabled,
    this.communitySettingRights,
    this.likeMindsPlan,
    this.isFreemiumCommunity,
  });

  factory Community.fromEntity(CommunityEntity entity) {
    return Community(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      purpose: entity.purpose,
      about: entity.about,
      branding: entity.branding != null
          ? Branding.fromEntity(entity.branding!)
          : null,
      membersCount: entity.membersCount,
      isMember: entity.isMember,
      pendingMembersCount: entity.pendingMembersCount,
      pendingChatRoomCount: entity.pendingChatRoomCount,
      openReportsCount: entity.openReportsCount,
      chatroomUnseen: entity.chatroomUnseen,
      updatedAt: entity.updatedAt,
      isAdmin: entity.isAdmin,
      state: entity.state,
      memberState: entity.memberState,
      createdBy: entity.createdBy,
      managedBy: entity.managedBy,
      date: entity.date,
      type: entity.type,
      subType: entity.subType,
      clickState: entity.clickState,
      chatroomCount: entity.chatroomCount,
      actions: entity.actions,
      newChatRoomUsers:
          entity.newChatRoomUsers?.map((e) => User.fromEntity(e)).toList(),
      chatRoomUsers:
          entity.chatRoomUsers?.map((e) => User.fromEntity(e)).toList(),
      memberRightStates: entity.memberRightStates,
      orderTime: entity.orderTime,
      menu: entity.menu,
      leaveCommunity: entity.leaveCommunity,
      isPaid: entity.isPaid,
      autoApproval: entity.autoApproval,
      gracePeriod: entity.gracePeriod,
      isDiscoverable: entity.isDiscoverable,
      websiteUrl: entity.websiteUrl,
      referralEnabled: entity.referralEnabled,
      communitySettingRights: entity.communitySettingRights
          ?.map((e) => CommunitySettingsRights.fromEntity(e))
          .toList(),
      likeMindsPlan: entity.likeMindsPlan,
      isFreemiumCommunity: entity.isFreemiumCommunity,
    );
  }

  CommunityEntity toEntity() {
    return CommunityEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      purpose: purpose,
      about: about,
      branding: branding?.toEntity(),
      membersCount: membersCount,
      isMember: isMember,
      pendingMembersCount: pendingMembersCount,
      pendingChatRoomCount: pendingChatRoomCount,
      openReportsCount: openReportsCount,
      chatroomUnseen: chatroomUnseen,
      updatedAt: updatedAt,
      isAdmin: isAdmin,
      state: state,
      memberState: memberState,
      createdBy: createdBy,
      managedBy: managedBy,
      date: date,
      type: type,
      subType: subType,
      clickState: clickState,
      chatroomCount: chatroomCount,
      actions: actions,
      newChatRoomUsers: newChatRoomUsers
          ?.map((User e) => e.toEntity())
          .cast<UserEntity>()
          .toList(),
      chatRoomUsers: chatRoomUsers
          ?.map((User e) => e.toEntity())
          .cast<UserEntity>()
          .toList(),
      memberRightStates: memberRightStates,
      orderTime: orderTime,
      menu: menu,
      leaveCommunity: leaveCommunity,
      isPaid: isPaid,
      autoApproval: autoApproval,
      gracePeriod: gracePeriod,
      isDiscoverable: isDiscoverable,
      websiteUrl: websiteUrl,
      referralEnabled: referralEnabled,
      communitySettingRights: communitySettingRights
          ?.map((e) => e.toEntity())
          .cast<CommunitySettingsRightsEntity>()
          .toList(),
      likeMindsPlan: likeMindsPlan,
      isFreemiumCommunity: isFreemiumCommunity,
    );
  }
}

@JsonSerializable()
class CommunityEntity {
  final int id;
  final String name;
  final int? state;
  final String? date;
  final int? type;
  final List<dynamic>? actions;
  final List<String>? menu;
  final String? purpose;
  final String? about;
  final BrandingEntity? branding;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'members_count')
  final int? membersCount;

  @JsonKey(name: 'is_member')
  final bool? isMember;

  @JsonKey(name: 'pending_members_count')
  final int? pendingMembersCount;

  @JsonKey(name: 'pending_chatroom_count')
  final int? pendingChatRoomCount;

  @JsonKey(name: 'open_reports_count')
  final int? openReportsCount;

  @JsonKey(name: 'chatroom_unseen')
  final int? chatroomUnseen;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @JsonKey(name: 'is_admin')
  final bool? isAdmin;

  @JsonKey(name: 'member_state')
  final int? memberState;

  @JsonKey(name: 'created_by')
  final String? createdBy;

  @JsonKey(name: 'managed_by')
  final String? managedBy;

  @JsonKey(name: 'sub_type')
  final int? subType;

  @JsonKey(name: 'click_state')
  final int? clickState;

  @JsonKey(name: 'chatroom_count')
  final int? chatroomCount;

  @JsonKey(name: 'new_chatroom_users')
  final List<UserEntity>? newChatRoomUsers;

  @JsonKey(name: 'chatroom_users')
  final List<UserEntity>? chatRoomUsers;

  @JsonKey(name: 'member_right_states')
  final List<int>? memberRightStates;

  @JsonKey(name: 'order_time')
  final int? orderTime;

  @JsonKey(name: 'leave_community')
  final dynamic leaveCommunity;

  @JsonKey(name: 'is_paid')
  final bool? isPaid;

  @JsonKey(name: 'auto_approval')
  final bool? autoApproval;

  @JsonKey(name: 'grace_period')
  final int? gracePeriod;

  @JsonKey(name: 'is_discoverable')
  final bool? isDiscoverable;

  @JsonKey(name: 'website_url')
  final String? websiteUrl;

  @JsonKey(name: 'referral_enabled')
  final bool? referralEnabled;

  @JsonKey(name: 'community_setting_rights')
  final List<CommunitySettingsRightsEntity>? communitySettingRights;

  @JsonKey(name: 'like_minds_plan')
  final String? likeMindsPlan;

  @JsonKey(name: 'is_freemium_community')
  final bool? isFreemiumCommunity;

  CommunityEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    this.purpose,
    this.about,
    this.branding,
    this.membersCount,
    this.isMember,
    this.pendingMembersCount,
    this.pendingChatRoomCount,
    this.openReportsCount,
    this.chatroomUnseen,
    this.updatedAt,
    this.isAdmin,
    this.state,
    this.memberState,
    this.createdBy,
    this.managedBy,
    this.date,
    this.type,
    this.subType,
    this.clickState,
    this.chatroomCount,
    this.actions,
    this.newChatRoomUsers,
    this.chatRoomUsers,
    this.memberRightStates,
    this.orderTime,
    this.menu,
    this.leaveCommunity,
    this.isPaid,
    this.autoApproval,
    this.gracePeriod,
    this.isDiscoverable,
    this.websiteUrl,
    this.referralEnabled,
    this.communitySettingRights,
    this.likeMindsPlan,
    this.isFreemiumCommunity,
  });

  factory CommunityEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityEntityToJson(this);
}
