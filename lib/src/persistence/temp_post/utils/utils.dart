import 'package:likeminds_feed/src/persistence/temp_post/schema/temp_post_hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart'; // Import the Post model

class LMPostDBInterface {
  /// Converts a [Post] object to a [PostDB] Hive object.
  static LMPostDB fromPost(Post post) {
    return LMPostDB(
      id: post.id,
      uuid: post.uuid,
      communityId: post.communityId,
      tempId: post.tempId,
      text: post.text,
      heading: post.heading,
      commentIds: post.commentIds,
      topicIds: post.topicIds,
      attachments: post.attachments?.map((e) => fromAttachment(e)).toList(),
      likeCount: post.likeCount,
      commentCount: post.commentCount,
      repostCount: post.repostCount,
      createdAt: post.createdAt,
      updatedAt: post.updatedAt,
      isLiked: post.isLiked,
      isPinned: post.isPinned,
      isSaved: post.isSaved,
      isEdited: post.isEdited,
      isDeleted: post.isDeleted,
      isRepost: post.isRepost,
      isRepostedByUser: post.isRepostedByUser,
      isPendingPost: post.isPendingPost,
      postStatus: post.postStatus,
    );
  }

  /// Converts a [PostDB] Hive object to a [Post] object.
  static Post toPost(LMPostDB postDB) {
    return Post(
      id: postDB.id,
      uuid: postDB.uuid,
      communityId: postDB.communityId,
      tempId: postDB.tempId,
      text: postDB.text,
      heading: postDB.heading,
      commentIds: postDB.commentIds,
      topicIds: postDB.topicIds,
      attachments: postDB.attachments?.map((e) => toAttachment(e)).toList(),
      likeCount: postDB.likeCount,
      commentCount: postDB.commentCount,
      repostCount: postDB.repostCount,
      createdAt: postDB.createdAt,
      updatedAt: postDB.updatedAt,
      isLiked: postDB.isLiked,
      isPinned: postDB.isPinned,
      isSaved: postDB.isSaved,
      isEdited: postDB.isEdited,
      isDeleted: postDB.isDeleted,
      isRepost: postDB.isRepost,
      isRepostedByUser: postDB.isRepostedByUser,
      isPendingPost: postDB.isPendingPost,
      postStatus: postDB.postStatus,
      menuItems: [],
    );
  }

  /// Converts an [Attachment] to [AttachmentDB] Hive object.
  static LMAttachmentDB fromAttachment(Attachment attachment) {
    return LMAttachmentDB(
      attachmentType: attachment.attachmentType,
      attachmentMeta: fromAttachmentMeta(attachment.attachmentMeta),
    );
  }

  /// Converts an [AttachmentDB] Hive object to an [Attachment].
  static Attachment toAttachment(LMAttachmentDB attachmentDB) {
    return Attachment(
      attachmentType: attachmentDB.attachmentType,
      attachmentMeta: toAttachmentMeta(attachmentDB.attachmentMeta),
    );
  }

  /// Converts [AttachmentMeta] to [AttachmentMetaDB] Hive object.
  static LMAttachmentMetaDB fromAttachmentMeta(AttachmentMeta attachmentMeta) {
    return LMAttachmentMetaDB(
      url: attachmentMeta.url,
      format: attachmentMeta.format,
      size: attachmentMeta.size,
      duration: attachmentMeta.duration,
      pageCount: attachmentMeta.pageCount,
      height: attachmentMeta.height,
      width: attachmentMeta.width,
      aspectRatio: attachmentMeta.aspectRatio,
      meta: attachmentMeta.meta,
      entityId: attachmentMeta.entityId,
      pollQuestion: attachmentMeta.pollQuestion,
      expiryTime: attachmentMeta.expiryTime,
      pollOptions: attachmentMeta.pollOptions,
      multiSelectState: attachmentMeta.multiSelectState,
      pollType: attachmentMeta.pollType,
      multiSelectNo: attachmentMeta.multiSelectNo,
      isAnonymous: attachmentMeta.isAnonymous,
      allowAddOption: attachmentMeta.allowAddOption,
      thumbnailUrl: attachmentMeta.thumbnailUrl,
    );
  }

  /// Converts [AttachmentMetaDB] Hive object to [AttachmentMeta].
  static AttachmentMeta toAttachmentMeta(LMAttachmentMetaDB metaDB) {
    return AttachmentMeta(
      url: metaDB.url,
      format: metaDB.format,
      size: metaDB.size,
      duration: metaDB.duration,
      pageCount: metaDB.pageCount,
      height: metaDB.height,
      width: metaDB.width,
      aspectRatio: metaDB.aspectRatio,
      meta: metaDB.meta,
      entityId: metaDB.entityId,
      pollQuestion: metaDB.pollQuestion,
      expiryTime: metaDB.expiryTime,
      pollOptions: metaDB.pollOptions,
      multiSelectState: metaDB.multiSelectState,
      pollType: metaDB.pollType,
      multiSelectNo: metaDB.multiSelectNo,
      isAnonymous: metaDB.isAnonymous,
      allowAddOption: metaDB.allowAddOption,
      thumbnailUrl: metaDB.thumbnailUrl,
    );
  }
}
