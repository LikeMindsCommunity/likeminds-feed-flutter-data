// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:feed_sdk/src/models/feed/post.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:feed_sdk/src/models/post/attachment_model.dart';
import 'package:feed_sdk/src/models/post/popup_menu_item_model.dart';

part 'post_model.g.dart';

class Post {
  final String id;
  final String text;
  final List<Attachment>? attachments;
  final int communityId;
  final bool isPinned;
  final String userId;
  final int likeCount;
  final bool isSaved;
  final List<PopupMenuItemModel> menuItems;
  final DateTime createdAt;
  final DateTime updatedAt;
  Post({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromEntity({required PostEntity postEntity}) {
    return Post(
        id: postEntity.id,
        text: postEntity.text,
        attachments: postEntity.attachments
            ?.map((e) => Attachment.fromEntity(e))
            .toList(),
        communityId: postEntity.communityId,
        isPinned: postEntity.isPinned,
        userId: postEntity.userId,
        likeCount: postEntity.likeCount,
        isSaved: postEntity.isSaved,
        menuItems: postEntity.menuItems
            .map((e) => PopupMenuItemModel.fromEntity(entity: e))
            .toList(),
        createdAt: DateTime.fromMillisecondsSinceEpoch(postEntity.createdAt),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(postEntity.updatedAt));
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      text: text,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      communityId: communityId,
      isPinned: isPinned,
      userId: userId,
      likeCount: likeCount,
      isSaved: isSaved,
      menuItems: menuItems.map((e) => e.toEntity()).toList(),
      createdAt: createdAt.millisecondsSinceEpoch.toInt(),
      updatedAt: updatedAt.millisecondsSinceEpoch.toInt(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PostEntity {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'community_id')
  final int communityId;
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'likes_count')
  final int likeCount;
  @JsonKey(name: 'is_saved')
  final bool isSaved;
  @JsonKey(name: 'menu_items')
  final List<PopupMenuItemModelEntity> menuItems;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  PostEntity({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
  });
  factory PostEntity.fromJson(Map<String, dynamic> data) =>
      _$PostEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
