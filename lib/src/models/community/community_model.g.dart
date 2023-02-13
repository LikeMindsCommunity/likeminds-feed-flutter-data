// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityEntity _$CommunityEntityFromJson(Map<String, dynamic> json) =>
    CommunityEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      purpose: json['purpose'] as String?,
      about: json['about'] as String?,
      branding: json['branding'] == null
          ? null
          : BrandingEntity.fromJson(json['branding'] as Map<String, dynamic>),
      membersCount: json['members_count'] as int?,
      isMember: json['is_member'] as bool,
      pendingMembersCount: json['pending_members_count'] as int,
      pendingChatRoomCount: json['pending_chatroom_count'] as int,
      openReportsCount: json['open_reports_count'] as int,
      chatroomUnseen: json['chatroom_unseen'] as int,
      updatedAt: json['updated_at'] as String?,
      isAdmin: json['is_admin'] as bool,
      state: json['state'] as int?,
      memberState: json['member_state'] as int?,
      createdBy: json['created_by'] as String?,
      managedBy: json['managed_by'] as String?,
      date: json['date'] as String?,
      type: json['type'] as int?,
      subType: json['sub_type'] as int?,
      clickState: json['click_state'] as int?,
      chatroomCount: json['chatroom_count'] as int?,
      actions: json['actions'] as List<dynamic>?,
      newChatRoomUsers: (json['new_chatroom_users'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatRoomUsers: (json['chatroom_users'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberRightStates: (json['member_right_states'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      orderTime: json['order_time'] as int?,
      menu: (json['menu'] as List<dynamic>?)?.map((e) => e as String).toList(),
      leaveCommunity: json['leave_community'],
      isPaid: json['is_paid'] as bool?,
      autoApproval: json['auto_approval'] as bool?,
      gracePeriod: json['grace_period'] as int?,
      isDiscoverable: json['is_discoverable'] as bool?,
      websiteUrl: json['website_url'] as String?,
      referralEnabled: json['referral_enabled'] as bool?,
      communitySettingRights: (json['community_setting_rights']
              as List<dynamic>?)
          ?.map((e) =>
              CommunitySettingsRightsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      likeMindsPlan: json['like_minds_plan'] as String?,
      isFreemiumCommunity: json['is_freemium_community'] as bool?,
    );

Map<String, dynamic> _$CommunityEntityToJson(CommunityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'date': instance.date,
      'type': instance.type,
      'actions': instance.actions,
      'menu': instance.menu,
      'purpose': instance.purpose,
      'about': instance.about,
      'branding': instance.branding,
      'image_url': instance.imageUrl,
      'members_count': instance.membersCount,
      'is_member': instance.isMember,
      'pending_members_count': instance.pendingMembersCount,
      'pending_chatroom_count': instance.pendingChatRoomCount,
      'open_reports_count': instance.openReportsCount,
      'chatroom_unseen': instance.chatroomUnseen,
      'updated_at': instance.updatedAt,
      'is_admin': instance.isAdmin,
      'member_state': instance.memberState,
      'created_by': instance.createdBy,
      'managed_by': instance.managedBy,
      'sub_type': instance.subType,
      'click_state': instance.clickState,
      'chatroom_count': instance.chatroomCount,
      'new_chatroom_users': instance.newChatRoomUsers,
      'chatroom_users': instance.chatRoomUsers,
      'member_right_states': instance.memberRightStates,
      'order_time': instance.orderTime,
      'leave_community': instance.leaveCommunity,
      'is_paid': instance.isPaid,
      'auto_approval': instance.autoApproval,
      'grace_period': instance.gracePeriod,
      'is_discoverable': instance.isDiscoverable,
      'website_url': instance.websiteUrl,
      'referral_enabled': instance.referralEnabled,
      'community_setting_rights': instance.communitySettingRights,
      'like_minds_plan': instance.likeMindsPlan,
      'is_freemium_community': instance.isFreemiumCommunity,
    };
