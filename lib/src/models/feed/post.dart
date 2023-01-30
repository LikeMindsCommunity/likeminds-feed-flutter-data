// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:feed_sdk/src/models/auth/user_model.dart';

part 'post.g.dart';

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
            ?.map((e) => Attachment.fromEntity(entity: e))
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
}

// _id: String | Id of the post
// text: String | text on post
// attachments: JSON Array | attachments on the post
// file_type: Int | type of attachment
// file_url: String | URL of file
// file_type: String | type of file
// file_size: String | size of file
// community_id: String | Id of community
// is_pinned: Bool | pin status of the post
// user_id: String | Id of the creator
// likes_count: Int | No. of likes on the post
// comments_count: Int | No. of comments on the post
// is_saved: Bool | If a user saves the post
// menu_items: JSON Array | list of menu items
// title: String | title of the menu item
// created_at: Int | epoch time of creation in ms
// updated_at: Int | epoch time of the last update in ms

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

class Attachment {
  final int? fileType;
  final String? fileUrl;
  final String? fileTypeString;
  final String? fileSize;

  Attachment(
      {required this.fileSize,
      required this.fileTypeString,
      required this.fileType,
      required this.fileUrl});
  factory Attachment.fromEntity({required AttachmentEntity entity}) {
    return Attachment(
        fileSize: entity.fileSize,
        fileType: entity.fileType,
        fileTypeString: entity.fileTypeString,
        fileUrl: entity.fileUrl);
  }
}

@JsonSerializable()
class AttachmentEntity {
  @JsonKey(name: 'file_type')
  final int? fileType;
  @JsonKey(name: 'file_url')
  final String? fileUrl;
  @JsonKey(name: 'file_type_S')
  final String? fileTypeString;
  @JsonKey(name: 'file_size')
  final String? fileSize;

  AttachmentEntity(
      {required this.fileSize,
      required this.fileTypeString,
      required this.fileType,
      required this.fileUrl});

  factory AttachmentEntity.fromJson(Map<String, dynamic> data) =>
      _$AttachmentEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);
}

class PopupMenuItemModel {
  final String title;
  PopupMenuItemModel({
    required this.title,
  });

  factory PopupMenuItemModel.fromEntity(
      {required PopupMenuItemModelEntity entity}) {
    return PopupMenuItemModel(title: entity.title);
  }
}

@JsonSerializable()
class PopupMenuItemModelEntity {
  final String title;
  PopupMenuItemModelEntity({
    required this.title,
  });

  factory PopupMenuItemModelEntity.fromJson(Map<String, dynamic> data) =>
      _$PopupMenuItemModelEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PopupMenuItemModelEntityToJson(this);
}

class PostUser {
  final int id;
  final String imageUrl;
  final String name;
  final String userUniqueId;
  final bool isGuest;
  final bool isDeleted;
  PostUser({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.userUniqueId,
    required this.isGuest,
    required this.isDeleted,
  });

  factory PostUser.fromEntity({required PostUserEntity entity}) {
    return PostUser(
        id: entity.id,
        imageUrl: entity.imageUrl,
        name: entity.name,
        userUniqueId: entity.userUniqueId,
        isGuest: entity.isGuest,
        isDeleted: entity.isDeleted);
  }
}

@JsonSerializable()
class PostUserEntity {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final String name;
  @JsonKey(name: 'user_unique_id')
  final String userUniqueId;
  @JsonKey(name: 'is_guest')
  final bool isGuest;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  PostUserEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.userUniqueId,
    required this.isGuest,
    required this.isDeleted,
  });
  factory PostUserEntity.fromJson(Map<String, dynamic> data) =>
      _$PostUserEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostUserEntityToJson(this);
}
