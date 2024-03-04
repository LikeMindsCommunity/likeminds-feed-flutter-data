import 'package:likeminds_feed/likeminds_feed.dart';

class ActivityEntityData {
  final String id;
  final List<Attachment>? attachments;
  final int? chatroomId;
  final int communityId;
  final int createdAt;
  final String? deleteReason;
  final String? deleteBy;
  final String? heading;
  final int? level;
  final String? postId;
  final bool? isDeleted;
  final bool? isPinned;
  final bool? isEdited;
  final String text;
  final List<Comment>? replies;
  final int? updatedAt;
  final String uuid;

  ActivityEntityData({
    required this.id,
    this.attachments,
    this.chatroomId,
    required this.communityId,
    required this.createdAt,
    this.deleteReason,
    this.deleteBy,
    this.heading,
    this.level,
    this.postId,
    this.isDeleted,
    this.isEdited,
    this.isPinned,
    this.replies,
    required this.text,
    this.updatedAt,
    required this.uuid,
  });

  static ActivityEntityData fromEntity(ActivityEntityDataEntity entity) {
    return ActivityEntityData(
      id: entity.id,
      attachments: entity.attachments,
      chatroomId: entity.chatroomId,
      communityId: entity.communityId,
      createdAt: entity.createdAt,
      deleteReason: entity.deleteReason,
      deleteBy: entity.deleteBy,
      heading: entity.heading,
      level: entity.level,
      postId: entity.postId,
      replies: entity.replies
          ?.map((e) => Comment.fromEntity(commentEntity: e))
          .toList(),
      isDeleted: entity.isDeleted,
      isEdited: entity.isEdited,
      isPinned: entity.isPinned,
      text: entity.text,
      updatedAt: entity.updatedAt,
      uuid: entity.uuid,
    );
  }

  ActivityEntityDataEntity toEntity() {
    return ActivityEntityDataEntity(
      id: id,
      attachments: attachments,
      chatroomId: chatroomId,
      communityId: communityId,
      createdAt: createdAt,
      deleteReason: deleteReason,
      deleteBy: deleteBy,
      heading: heading,
      level: level,
      postId: postId,
      isDeleted: isDeleted,
      isEdited: isEdited,
      isPinned: isPinned,
      text: text,
      replies: replies?.map((e) => e.toEntity()).toList(),
      updatedAt: updatedAt,
      uuid: uuid,
    );
  }
}

class ActivityEntityDataEntity {
  final String id;
  final List<Attachment>? attachments;
  final int? chatroomId;
  final int communityId;
  final int createdAt;
  final String? deleteReason;
  final String? deleteBy;
  final String? heading;
  final int? level;
  final String? postId;
  final bool? isDeleted;
  final bool? isPinned;
  final bool? isEdited;
  final String text;
  final List<CommentEntity>? replies;
  final int? updatedAt;
  final String uuid;

  ActivityEntityDataEntity({
    required this.id,
    this.attachments,
    this.chatroomId,
    required this.communityId,
    required this.createdAt,
    this.deleteReason,
    this.deleteBy,
    this.heading,
    this.level,
    this.postId,
    this.isDeleted,
    this.isEdited,
    this.isPinned,
    this.replies,
    required this.text,
    this.updatedAt,
    required this.uuid,
  });

  static fromJson(Map<String, dynamic> json) {
    return ActivityEntityDataEntity(
        id: json['_id'] as String,
        chatroomId: json['chatroom_id'] as int?,
        communityId: json['community_id'] as int,
        createdAt: json['created_at'] as int,
        deleteReason: json['delete_reason'] as String?,
        deleteBy: json['deleted_by'] as String?,
        heading: json['heading'] as String?,
        isDeleted: json['is_deleted'] as bool?,
        isEdited: json['is_edited'] as bool?,
        level: json['level'] as int?,
        postId: json['post_id'] as String?,
        isPinned: json['is_pinned'] as bool?,
        text: json['text'] as String,
        replies: (json['replies'] as List<dynamic>?)
            ?.map((e) => CommentEntity.fromJson(e))
            .toList(),
        updatedAt: json['updated_at'] as int,
        uuid: json['uuid'] as String,
        attachments: (json['attachments'] as List<dynamic>?)
            ?.map((e) => Attachment.fromEntity(AttachmentEntity.fromJson(e)))
            .toList());
  }

  toJson() {
    return {
      '_id': id,
      'chatroom_id': chatroomId,
      'community_id': communityId,
      'created_at': createdAt,
      'delete_reason': deleteReason,
      'deleted_by': deleteBy,
      'heading': heading,
      'is_deleted': isDeleted,
      'is_edited': isEdited,
      'level': level,
      'post_id': postId,
      'is_pinned': isPinned,
      'text': text,
      'updated_at': updatedAt,
      'uuid': uuid,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
    };
  }
}
