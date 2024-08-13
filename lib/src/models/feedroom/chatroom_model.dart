import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'chatroom_model.g.dart';

class Chatroom {
  dynamic access;
  bool accessWithoutSubscription;
  String answerText;
  int answersCount;
  int attachmentCount;
  bool attachmentsUploaded;
  bool attended;
  int attendingCount;
  bool attendingStatus;
  int audioCount;
  bool autoFollowDone;
  String cardCreationTime;
  dynamic chatRequestCreatedAt;
  dynamic chatRequestState;
  dynamic chatRequestedBy;
  List<dynamic> cohorts;
  int communityId;
  String communityName;
  int createdAt;
  String customTag;
  String date;
  int dateEpoch;
  int dateTime;
  int duration;
  String eventKind;
  bool externalSeen;
  bool followStatus;
  String header;
  int id;
  int imageCount;
  bool includeMembersLater;
  bool isEdited;
  bool isGuest;
  bool isPaid;
  bool isPending;
  bool isPinned;
  bool isPrivate;
  bool isPrivateMember;
  bool isSecret;
  bool isTagged;
  User member;
  bool memberCanMessage;
  bool muteStatus;
  int onlineLinkEnableBefore;
  dynamic onlineLinkType;
  int participantsCount;
  int pdfCount;
  int pollsCount;
  List<dynamic> reactions;
  String shareLink;
  int state;
  dynamic thirdPartyUniqueId;
  String title;
  int totalResponseCount;
  int type;
  int updatedAt;
  int videoCount;

  Chatroom({
    required this.access,
    required this.accessWithoutSubscription,
    required this.answerText,
    required this.answersCount,
    required this.attachmentCount,
    required this.attachmentsUploaded,
    required this.attended,
    required this.attendingCount,
    required this.attendingStatus,
    required this.audioCount,
    required this.autoFollowDone,
    required this.cardCreationTime,
    required this.chatRequestCreatedAt,
    required this.chatRequestState,
    required this.chatRequestedBy,
    required this.cohorts,
    required this.communityId,
    required this.communityName,
    required this.createdAt,
    required this.customTag,
    required this.date,
    required this.dateEpoch,
    required this.dateTime,
    required this.duration,
    required this.eventKind,
    required this.externalSeen,
    required this.followStatus,
    required this.header,
    required this.id,
    required this.imageCount,
    required this.includeMembersLater,
    required this.isEdited,
    required this.isGuest,
    required this.isPaid,
    required this.isPending,
    required this.isPinned,
    required this.isPrivate,
    required this.isPrivateMember,
    required this.isSecret,
    required this.isTagged,
    required this.member,
    required this.memberCanMessage,
    required this.muteStatus,
    required this.onlineLinkEnableBefore,
    required this.onlineLinkType,
    required this.participantsCount,
    required this.pdfCount,
    required this.pollsCount,
    required this.reactions,
    required this.shareLink,
    required this.state,
    required this.thirdPartyUniqueId,
    required this.title,
    required this.totalResponseCount,
    required this.type,
    required this.updatedAt,
    required this.videoCount,
  });

  factory Chatroom.fromEntity(ChatroomEntity entity) {
    return Chatroom(
      access: entity.access,
      accessWithoutSubscription: entity.accessWithoutSubscription,
      answerText: entity.answerText,
      answersCount: entity.answersCount,
      attachmentCount: entity.attachmentCount,
      attachmentsUploaded: entity.attachmentsUploaded,
      attended: entity.attended,
      attendingCount: entity.attendingCount,
      attendingStatus: entity.attendingStatus,
      audioCount: entity.audioCount,
      autoFollowDone: entity.autoFollowDone,
      cardCreationTime: entity.cardCreationTime,
      chatRequestCreatedAt: entity.chatRequestCreatedAt,
      chatRequestState: entity.chatRequestState,
      chatRequestedBy: entity.chatRequestedBy,
      cohorts: entity.cohorts,
      communityId: entity.communityId,
      communityName: entity.communityName,
      createdAt: entity.createdAt,
      customTag: entity.customTag,
      date: entity.date,
      dateEpoch: entity.dateEpoch,
      dateTime: entity.dateTime,
      duration: entity.duration,
      eventKind: entity.eventKind,
      externalSeen: entity.externalSeen,
      followStatus: entity.followStatus,
      header: entity.header,
      id: entity.id,
      imageCount: entity.imageCount,
      includeMembersLater: entity.includeMembersLater,
      isEdited: entity.isEdited,
      isGuest: entity.isGuest,
      isPaid: entity.isPaid,
      isPending: entity.isPending,
      isPinned: entity.isPinned,
      isPrivate: entity.isPrivate,
      isPrivateMember: entity.isPrivateMember,
      isSecret: entity.isSecret,
      isTagged: entity.isTagged,
      member: User.fromEntity(entity.member),
      memberCanMessage: entity.memberCanMessage,
      muteStatus: entity.muteStatus,
      onlineLinkEnableBefore: entity.onlineLinkEnableBefore,
      onlineLinkType: entity.onlineLinkType,
      participantsCount: entity.participantsCount,
      pdfCount: entity.pdfCount,
      pollsCount: entity.pollsCount,
      reactions: entity.reactions,
      shareLink: entity.shareLink,
      state: entity.state,
      thirdPartyUniqueId: entity.thirdPartyUniqueId,
      title: entity.title,
      totalResponseCount: entity.totalResponseCount,
      type: entity.type,
      updatedAt: entity.updatedAt,
      videoCount: entity.videoCount,
    );
  }

  ChatroomEntity toEntity() {
    return ChatroomEntity(
      access: access,
      accessWithoutSubscription: accessWithoutSubscription,
      answerText: answerText,
      answersCount: answersCount,
      attachmentCount: attachmentCount,
      attachmentsUploaded: attachmentsUploaded,
      attended: attended,
      attendingCount: attendingCount,
      attendingStatus: attendingStatus,
      audioCount: audioCount,
      autoFollowDone: autoFollowDone,
      cardCreationTime: cardCreationTime,
      chatRequestCreatedAt: chatRequestCreatedAt,
      chatRequestState: chatRequestState,
      chatRequestedBy: chatRequestedBy,
      cohorts: cohorts,
      communityId: communityId,
      communityName: communityName,
      createdAt: createdAt,
      customTag: customTag,
      date: date,
      dateEpoch: dateEpoch,
      dateTime: dateTime,
      duration: duration,
      eventKind: eventKind,
      externalSeen: externalSeen,
      followStatus: followStatus,
      header: header,
      id: id,
      imageCount: imageCount,
      includeMembersLater: includeMembersLater,
      isEdited: isEdited,
      isGuest: isGuest,
      isPaid: isPaid,
      isPending: isPending,
      isPinned: isPinned,
      isPrivate: isPrivate,
      isPrivateMember: isPrivateMember,
      isSecret: isSecret,
      isTagged: isTagged,
      member: member.toEntity(),
      memberCanMessage: memberCanMessage,
      muteStatus: muteStatus,
      onlineLinkEnableBefore: onlineLinkEnableBefore,
      onlineLinkType: onlineLinkType,
      participantsCount: participantsCount,
      pdfCount: pdfCount,
      pollsCount: pollsCount,
      reactions: reactions,
      shareLink: shareLink,
      state: state,
      thirdPartyUniqueId: thirdPartyUniqueId,
      title: title,
      totalResponseCount: totalResponseCount,
      type: type,
      updatedAt: updatedAt,
      videoCount: videoCount,
    );
  }
}

@JsonSerializable()
class ChatroomEntity {
  final dynamic access;
  @JsonKey(name: 'access_without_subscription')
  final bool accessWithoutSubscription;
  @JsonKey(name: 'answer_text')
  final String answerText;
  @JsonKey(name: 'answers_count')
  final int answersCount;
  @JsonKey(name: 'attachment_count')
  final int attachmentCount;
  @JsonKey(name: 'attachments_uploaded')
  final bool attachmentsUploaded;
  final bool attended;
  @JsonKey(name: 'attending_count')
  final int attendingCount;
  @JsonKey(name: 'attending_status')
  final bool attendingStatus;
  @JsonKey(name: 'audio_count')
  final int audioCount;
  @JsonKey(name: 'auto_follow_done')
  final bool autoFollowDone;
  @JsonKey(name: 'card_creation_time')
  final String cardCreationTime;
  @JsonKey(name: 'chat_request_created_at')
  final dynamic chatRequestCreatedAt;
  @JsonKey(name: 'chat_request_state')
  final dynamic chatRequestState;
  @JsonKey(name: 'chat_requested_by')
  final dynamic chatRequestedBy;
  final List<dynamic> cohorts;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'community_name')
  final String communityName;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'custom_tag')
  final String customTag;
  final String date;
  @JsonKey(name: 'date_epoch')
  final int dateEpoch;
  @JsonKey(name: 'date_time')
  final int dateTime;
  final int duration;
  @JsonKey(name: 'event_kind')
  final String eventKind;
  @JsonKey(name: 'external_seen')
  final bool externalSeen;
  @JsonKey(name: 'follow_status')
  final bool followStatus;
  final String header;
  final int id;
  @JsonKey(name: 'image_count')
  final int imageCount;
  @JsonKey(name: 'include_members_later')
  final bool includeMembersLater;
  @JsonKey(name: 'is_edited')
  final bool isEdited;
  @JsonKey(name: 'is_guest')
  final bool isGuest;
  @JsonKey(name: 'is_paid')
  final bool isPaid;
  @JsonKey(name: 'is_pending')
  final bool isPending;
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @JsonKey(name: 'is_private')
  final bool isPrivate;
  @JsonKey(name: 'is_private_member')
  final bool isPrivateMember;
  @JsonKey(name: 'is_secret ')
  final bool isSecret;
  @JsonKey(name: 'is_tagged')
  final bool isTagged;
  final UserEntity member;
  @JsonKey(name: 'member_can_message')
  final bool memberCanMessage;
  @JsonKey(name: 'mute_status')
  final bool muteStatus;
  @JsonKey(name: 'online_link_enable_before')
  final int onlineLinkEnableBefore;
  @JsonKey(name: 'online_link_type')
  final dynamic onlineLinkType;
  @JsonKey(name: 'participants_count')
  final int participantsCount;
  @JsonKey(name: 'pdf_count')
  final int pdfCount;
  @JsonKey(name: 'polls_count')
  final int pollsCount;
  final List<dynamic> reactions;
  @JsonKey(name: 'share_link')
  final String shareLink;
  final int state;
  @JsonKey(name: 'third_party_unique_id')
  final dynamic thirdPartyUniqueId;
  final String title;
  @JsonKey(name: 'total_response_count')
  final int totalResponseCount;
  final int type;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'video_count')
  final int videoCount;

  ChatroomEntity({
    required this.access,
    required this.accessWithoutSubscription,
    required this.answerText,
    required this.answersCount,
    required this.attachmentCount,
    required this.attachmentsUploaded,
    required this.attended,
    required this.attendingCount,
    required this.attendingStatus,
    required this.audioCount,
    required this.autoFollowDone,
    required this.cardCreationTime,
    required this.chatRequestCreatedAt,
    required this.chatRequestState,
    required this.chatRequestedBy,
    required this.cohorts,
    required this.communityId,
    required this.communityName,
    required this.createdAt,
    required this.customTag,
    required this.date,
    required this.dateEpoch,
    required this.dateTime,
    required this.duration,
    required this.eventKind,
    required this.externalSeen,
    required this.followStatus,
    required this.header,
    required this.id,
    required this.imageCount,
    required this.includeMembersLater,
    required this.isEdited,
    required this.isGuest,
    required this.isPaid,
    required this.isPending,
    required this.isPinned,
    required this.isPrivate,
    required this.isPrivateMember,
    required this.isSecret,
    required this.isTagged,
    required this.member,
    required this.memberCanMessage,
    required this.muteStatus,
    required this.onlineLinkEnableBefore,
    required this.onlineLinkType,
    required this.participantsCount,
    required this.pdfCount,
    required this.pollsCount,
    required this.reactions,
    required this.shareLink,
    required this.state,
    required this.thirdPartyUniqueId,
    required this.title,
    required this.totalResponseCount,
    required this.type,
    required this.updatedAt,
    required this.videoCount,
  });

  factory ChatroomEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatroomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatroomEntityToJson(this);
}
