import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'community_model.g.dart';

/// {@template community_data}
/// Contains all details related to a community within the application.
/// The [id] and [name] parameters are required.
/// All other parameters are optional.
class Community {
  /// The unique identifier of the community.
  final int id;

  /// The name of the community.
  final String name;

  /// The URL of the community's image, if available.
  final String? imageUrl;

  /// The purpose or mission statement of the community, if available.
  final String? purpose;

  /// A brief description or about section of the community, if available.
  final String? about;

  /// The number of members in the community, if available.
  final int? membersCount;

  /// Indicates whether the current user is a member of the community.
  final bool? isMember;

  /// The number of membership requests pending approval, if available.
  final int? pendingMembersCount;

  /// The number of pending chat rooms awaiting action, if available.
  final int? pendingChatRoomCount;

  /// The number of open reports within the community, if available.
  final int? openReportsCount;

  /// The number of unseen chat rooms, if available.
  final int? chatroomUnseen;

  /// The timestamp of the last update to the community, if available.
  final int? updatedAt;

  /// Indicates whether the current user is an admin of the community.
  final bool? isAdmin;

  /// The current state of the community.
  final int? state;

  /// The current state of the member within the community.
  final int? memberState;

  /// The identifier of the user who created the community, if available.
  final String? createdBy;

  /// The identifier of the user who manages the community, if available.
  final String? managedBy;

  /// The date the community was created, if available.
  final String? date;

  /// The type of community.
  final int? type;

  /// The subtype of the community, if available.
  final int? subType;

  /// The click state of the community, if available.
  final int? clickState;

  /// The number of chat rooms in the community, if available.
  final int? chatroomCount;

  /// A list of actions available to the user within the community.
  final List<dynamic>? actions;

  /// A list of new chat room users, if available.
  final List<User>? newChatRoomUsers;

  /// A list of chat room users, if available.
  final List<User>? chatRoomUsers;

  /// A list of member right states within the community.
  final List<int>? memberRightStates;

  /// The order time for the community, if available.
  final int? orderTime;

  /// A list of menu items available in the community.
  final List<String>? menu;

  /// Details of the leave community action, if available.
  final dynamic leaveCommunity;

  /// Indicates whether the community is a paid community.
  final bool? isPaid;

  /// Indicates whether membership approval is automatic.
  final bool? autoApproval;

  /// The grace period for the community, if available.
  final int? gracePeriod;

  /// Indicates whether the community is discoverable.
  final bool? isDiscoverable;

  /// The URL of the community's website, if available.
  final String? websiteUrl;

  /// Indicates whether referrals are enabled for the community.
  final bool? referralEnabled;

  /// A list of community setting rights, if available.
  final List<CommunitySettingsRights>? communitySettingRights;

  /// The plan of the community within the LikeMinds ecosystem.
  final String? likeMindsPlan;

  /// Indicates whether the community is a freemium community.
  final bool? isFreemiumCommunity;

  /// A list of settings related to the community.
  final List<CommunitySettings>? communitySettings;

  /// {@macro community_data}
  Community({
    required this.id,
    required this.name,
    this.imageUrl,
    this.purpose,
    this.about,
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
    this.communitySettings,
  });

  factory Community.fromEntity(CommunityEntity entity) {
    return Community(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      purpose: entity.purpose,
      about: entity.about,
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
      communitySettings: entity.communitySettings
          ?.map((e) => CommunitySettings.fromEntity(e))
          .toList(),
    );
  }

  CommunityEntity toEntity() {
    return CommunityEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      purpose: purpose,
      about: about,
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
      newChatRoomUsers:
          newChatRoomUsers?.map((User e) => e.toEntity()).toList(),
      chatRoomUsers: chatRoomUsers?.map((User e) => e.toEntity()).toList(),
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
      communitySettingRights:
          communitySettingRights?.map((e) => e.toEntity()).toList(),
      likeMindsPlan: likeMindsPlan,
      isFreemiumCommunity: isFreemiumCommunity,
      communitySettings: communitySettings?.map((e) => e.toEntity()).toList(),
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

  @JsonKey(name: 'community_settings')
  final List<CommunitySettingsEntity>? communitySettings;

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
    this.communitySettings,
  });

  factory CommunityEntity.fromJson(Map<String, dynamic> json) =>
      _$CommunityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityEntityToJson(this);
}
