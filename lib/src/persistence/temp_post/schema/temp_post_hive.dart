import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'temp_post_hive.g.dart';

@HiveType(typeId: 60)
class LMTempPostDB extends HiveObject {
  @HiveField(0)
  LMPostDB post;

  LMTempPostDB({
    required this.post,
  });
}

@HiveType(typeId: 61)
class LMPostDB extends HiveObject {
  // Post Details
  @HiveField(0)
  String id;

  @HiveField(1)
  String uuid;

  @HiveField(2)
  int communityId;

  @HiveField(3)
  String? tempId;

  // Post Data
  @HiveField(4)
  String text;

  @HiveField(5)
  String? heading;

  @HiveField(6)
  List<String>? commentIds;

  @HiveField(7)
  List<String>? topicIds;

  @HiveField(8)
  List<LMAttachmentDB>? attachments;

  @HiveField(9)
  int likeCount;

  @HiveField(10)
  int commentCount;

  @HiveField(11)
  int repostCount;

  @HiveField(12)
  DateTime createdAt;

  @HiveField(13)
  DateTime updatedAt;

  @HiveField(14)
  bool isLiked;

  @HiveField(15)
  bool isPinned;

  @HiveField(16)
  bool isSaved;

  @HiveField(17)
  bool isEdited;

  @HiveField(18)
  bool? isDeleted;

  @HiveField(19)
  bool isRepost;

  @HiveField(20)
  bool isRepostedByUser;

  @HiveField(21)
  bool isPendingPost;

  @HiveField(22)
  String postStatus;

  @HiveField(23)
  int? feedroomId;

  LMPostDB({
    required this.id,
    required this.uuid,
    required this.communityId,
    this.tempId,
    required this.text,
    this.heading,
    this.commentIds,
    this.topicIds,
    this.attachments,
    required this.likeCount,
    required this.commentCount,
    required this.repostCount,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.isPinned,
    required this.isSaved,
    required this.isEdited,
    this.isDeleted,
    required this.isRepost,
    required this.isRepostedByUser,
    required this.isPendingPost,
    required this.postStatus,
    this.feedroomId,
  });
}

@HiveType(typeId: 63)
class LMAttachmentDB extends HiveObject {
  @HiveField(0)
  int attachmentType;

  @HiveField(1)
  LMAttachmentMetaDB attachmentMeta;

  LMAttachmentDB({
    required this.attachmentType,
    required this.attachmentMeta,
  });
}

@HiveType(typeId: 64)
class LMAttachmentMetaDB extends HiveObject {
  @HiveField(0)
  String? url;

  @HiveField(1)
  String? format;

  @HiveField(2)
  int? size;

  @HiveField(3)
  int? duration;

  @HiveField(4)
  int? pageCount;

  @HiveField(5)
  int? height;

  @HiveField(6)
  int? width;

  @HiveField(7)
  double? aspectRatio;

  @HiveField(8)
  Map<String, dynamic>? meta;

  @HiveField(9)
  String? entityId;

  @HiveField(10)
  String? pollQuestion;

  @HiveField(11)
  int? expiryTime;

  @HiveField(12)
  List<String>? pollOptions;

  @HiveField(13)
  String? multiSelectState;

  @HiveField(14)
  String? pollType;

  @HiveField(15)
  int? multiSelectNo;

  @HiveField(16)
  bool? isAnonymous;

  @HiveField(17)
  bool? allowAddOption;

  @HiveField(18)
  String? thumbnailUrl;

  /// The local path of the attachment.
  @HiveField(19)
  String? path;

  /// The bytes of the attachment used on web platform.
  @HiveField(20)
  Uint8List? bytes;

  LMAttachmentMetaDB({
    this.url,
    this.format,
    this.size,
    this.duration,
    this.pageCount,
    this.height,
    this.width,
    this.aspectRatio,
    this.meta,
    this.entityId,
    this.pollQuestion,
    this.expiryTime,
    this.pollOptions,
    this.multiSelectState,
    this.pollType,
    this.multiSelectNo,
    this.isAnonymous,
    this.allowAddOption,
    this.thumbnailUrl,
    this.path,
    this.bytes,
  });
}
