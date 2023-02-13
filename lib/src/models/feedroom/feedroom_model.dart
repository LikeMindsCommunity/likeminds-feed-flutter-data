import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'feedroom_model.g.dart';

class FeedRoom {
  final int id;
  final String title;
  final String header;
  final String date;
  final int? dateEpoch;
  final int? dateTime;
  final int? duration;
  final String? cardCreationTime;
  final String? shareLink;
  final String? thirdPartyUniqueId;
  final int state;
  final bool? isPrivate;
  final bool? isSecret;
  final bool? isPending;
  final bool? isPrivateMember;
  final bool? isTagged;
  final bool? isGuest;
  final bool? isPaid;
  final bool? isPinned;
  final bool? isEdited;
  final bool? hasBeenNamed;
  final bool? autoFollowDone;
  final bool? includeMembersLater;
  final bool? accessWithoutSubscription;
  final bool? externalSeen;
  final bool? showFollowTelescope;
  final bool? showFollowAutoTag;
  final bool? memberCanMessage;
  final bool? muteStatus;
  final bool? followStatus;
  final int communityId;
  final String? communityName;
  final String chatroomImageUrl;
  final int? onlineLinkEnableBefore;
  final String? onlineLinkType;
  final int participantsCount;
  final int? memberId;
  final String? access;
  final User member;
  final List<dynamic>? cohorts;
  final List<dynamic>? coHosts;

  FeedRoom({
    required this.id,
    required this.title,
    required this.header,
    required this.date,
    this.dateEpoch,
    this.dateTime,
    this.duration,
    this.cardCreationTime,
    this.shareLink,
    this.thirdPartyUniqueId,
    required this.state,
    this.isPrivate,
    this.isSecret,
    this.isPending,
    this.isPrivateMember,
    this.isTagged,
    this.isGuest,
    this.isPaid,
    this.isPinned,
    this.isEdited,
    this.hasBeenNamed,
    this.autoFollowDone,
    this.includeMembersLater,
    this.accessWithoutSubscription,
    this.externalSeen,
    this.showFollowTelescope,
    this.showFollowAutoTag,
    this.memberCanMessage,
    this.muteStatus,
    this.followStatus,
    required this.communityId,
    this.communityName,
    required this.chatroomImageUrl,
    this.onlineLinkEnableBefore,
    this.onlineLinkType,
    required this.participantsCount,
    this.memberId,
    this.access,
    required this.member,
    this.cohorts,
    this.coHosts,
  });

  factory FeedRoom.fromEntity(FeedRoomEntity entity) {
    return FeedRoom(
      id: entity.id,
      title: entity.title,
      header: entity.header,
      date: entity.date,
      dateEpoch: entity.dateEpoch,
      dateTime: entity.dateTime,
      duration: entity.duration,
      cardCreationTime: entity.cardCreationTime,
      shareLink: entity.shareLink,
      thirdPartyUniqueId: entity.thirdPartyUniqueId,
      state: entity.state,
      isPrivate: entity.isPrivate,
      isSecret: entity.isSecret,
      isPending: entity.isPending,
      isPrivateMember: entity.isPrivateMember,
      isTagged: entity.isTagged,
      isGuest: entity.isGuest,
      isPaid: entity.isPaid,
      isPinned: entity.isPinned,
      isEdited: entity.isEdited,
      hasBeenNamed: entity.hasBeenNamed,
      autoFollowDone: entity.autoFollowDone,
      includeMembersLater: entity.includeMembersLater,
      accessWithoutSubscription: entity.accessWithoutSubscription,
      externalSeen: entity.externalSeen,
      showFollowTelescope: entity.showFollowTelescope,
      showFollowAutoTag: entity.showFollowAutoTag,
      memberCanMessage: entity.memberCanMessage,
      muteStatus: entity.muteStatus,
      followStatus: entity.followStatus,
      communityId: entity.communityId,
      communityName: entity.communityName,
      chatroomImageUrl: entity.chatroomImageUrl,
      onlineLinkEnableBefore: entity.onlineLinkEnableBefore,
      onlineLinkType: entity.onlineLinkType,
      participantsCount: entity.participantsCount,
      memberId: entity.memberId,
      access: entity.access,
      member: User.fromEntity(entity.member),
      cohorts: entity.cohorts,
      coHosts: entity.coHosts,
    );
  }

  FeedRoomEntity toEntity() {
    return FeedRoomEntity(
      id: id,
      title: title,
      header: header,
      date: date,
      dateEpoch: dateEpoch,
      dateTime: dateTime,
      duration: duration,
      cardCreationTime: cardCreationTime,
      shareLink: shareLink,
      thirdPartyUniqueId: thirdPartyUniqueId,
      state: state,
      isPrivate: isPrivate,
      isSecret: isSecret,
      isPending: isPending,
      isPrivateMember: isPrivateMember,
      isTagged: isTagged,
      isGuest: isGuest,
      isPaid: isPaid,
      isPinned: isPinned,
      isEdited: isEdited,
      hasBeenNamed: hasBeenNamed,
      autoFollowDone: autoFollowDone,
      includeMembersLater: includeMembersLater,
      accessWithoutSubscription: accessWithoutSubscription,
      externalSeen: externalSeen,
      showFollowTelescope: showFollowTelescope,
      showFollowAutoTag: showFollowAutoTag,
      memberCanMessage: memberCanMessage,
      muteStatus: muteStatus,
      followStatus: followStatus,
      communityId: communityId,
      communityName: communityName,
      chatroomImageUrl: chatroomImageUrl,
      onlineLinkEnableBefore: onlineLinkEnableBefore,
      onlineLinkType: onlineLinkType,
      participantsCount: participantsCount,
      memberId: memberId,
      access: access,
      member: member.toEntity(),
      cohorts: cohorts,
      coHosts: coHosts,
    );
  }
}

@JsonSerializable()
class FeedRoomEntity {
  final int id;
  final String title;
  final String header;
  final String date;
  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;
  @JsonKey(name: 'date_time')
  final int? dateTime;
  final int? duration;
  @JsonKey(name: 'card_creation_time')
  final String? cardCreationTime;
  @JsonKey(name: 'share_link')
  final String? shareLink;
  @JsonKey(name: 'third_party_unique_id')
  final String? thirdPartyUniqueId;
  final int state;
  @JsonKey(name: 'is_private')
  final bool? isPrivate;
  @JsonKey(name: 'is_secret')
  final bool? isSecret;
  @JsonKey(name: 'is_pending')
  final bool? isPending;
  @JsonKey(name: 'is_private_member')
  final bool? isPrivateMember;
  @JsonKey(name: 'is_tagged')
  final bool? isTagged;
  @JsonKey(name: 'is_guest')
  final bool? isGuest;
  @JsonKey(name: 'is_paid')
  final bool? isPaid;
  @JsonKey(name: 'is_pinned')
  final bool? isPinned;
  @JsonKey(name: 'is_edited')
  final bool? isEdited;
  @JsonKey(name: 'has_been_named')
  final bool? hasBeenNamed;
  @JsonKey(name: 'auto_follow_done')
  final bool? autoFollowDone;
  @JsonKey(name: 'include_members_later')
  final bool? includeMembersLater;
  @JsonKey(name: 'access_without_subscription')
  final bool? accessWithoutSubscription;
  @JsonKey(name: 'external_seen')
  final bool? externalSeen;
  @JsonKey(name: 'show_follow_telescope')
  final bool? showFollowTelescope;
  @JsonKey(name: 'show_follow_auto_tag')
  final bool? showFollowAutoTag;
  @JsonKey(name: 'member_can_message')
  final bool? memberCanMessage;
  @JsonKey(name: 'mute_status')
  final bool? muteStatus;
  @JsonKey(name: 'follow_status')
  final bool? followStatus;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'community_name')
  final String? communityName;
  @JsonKey(name: 'chatroom_image_url')
  final String chatroomImageUrl;
  @JsonKey(name: 'online_link_enable_before')
  final int? onlineLinkEnableBefore;
  @JsonKey(name: 'online_link_type')
  final String? onlineLinkType;
  @JsonKey(name: 'participants_count')
  final int participantsCount;
  @JsonKey(name: 'member_id')
  final int? memberId;
  final String? access;
  final UserEntity member;
  final List<dynamic>? cohorts;
  @JsonKey(name: 'co_hosts')
  final List<dynamic>? coHosts;

  FeedRoomEntity({
    required this.id,
    required this.title,
    required this.header,
    required this.date,
    this.dateEpoch,
    this.dateTime,
    this.duration,
    this.cardCreationTime,
    this.shareLink,
    this.thirdPartyUniqueId,
    required this.state,
    this.isPrivate,
    this.isSecret,
    this.isPending,
    this.isPrivateMember,
    this.isTagged,
    this.isGuest,
    this.isPaid,
    this.isPinned,
    this.isEdited,
    this.hasBeenNamed,
    this.autoFollowDone,
    this.includeMembersLater,
    this.accessWithoutSubscription,
    this.externalSeen,
    this.showFollowTelescope,
    this.showFollowAutoTag,
    this.memberCanMessage,
    this.muteStatus,
    this.followStatus,
    required this.communityId,
    this.communityName,
    required this.chatroomImageUrl,
    this.onlineLinkEnableBefore,
    this.onlineLinkType,
    required this.participantsCount,
    this.memberId,
    this.access,
    required this.member,
    this.cohorts,
    this.coHosts,
  });

  factory FeedRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedRoomEntityToJson(this);
}
