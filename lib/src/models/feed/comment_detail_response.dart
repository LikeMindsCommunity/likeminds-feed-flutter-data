// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feed_sdk/src/models/feed/comment_replies.dart';
import 'package:feed_sdk/src/models/feed/post_replies.dart';
import 'package:feed_sdk/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_detail_response.g.dart';

class CommentDetailResponse {
  final CommentReplies postReplies;
  final Map<String, PostUser> users;
  CommentDetailResponse({
    required this.postReplies,
    required this.users,
  });
  factory CommentDetailResponse.fromEntity(CommentDetailResponseEntity entity) {
    return CommentDetailResponse(
        postReplies: CommentReplies.fromEntity(entity.postReplies),
        users: entity.users.map(
            (key, value) => MapEntry(key, PostUser.fromEntity(entity: value))));
  }
}

@JsonSerializable(explicitToJson: true)
class CommentDetailResponseEntity {
  @JsonKey(name: 'comment')
  final CommentRepliesEntity postReplies;
  final Map<String, PostUserEntity> users;
  CommentDetailResponseEntity({
    required this.postReplies,
    required this.users,
  });
  factory CommentDetailResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$CommentDetailResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$CommentDetailResponseEntityToJson(this);
}
