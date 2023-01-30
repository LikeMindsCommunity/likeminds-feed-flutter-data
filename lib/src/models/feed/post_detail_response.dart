// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feed_sdk/src/models/feed/post.dart';
import 'package:feed_sdk/src/models/feed/post_replies.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_detail_response.g.dart';

class PostDetailResponse {
  final PostReplies postReplies;
  final Map<String, PostUser> users;
  PostDetailResponse({
    required this.postReplies,
    required this.users,
  });
  factory PostDetailResponse.fromEntity(PostDetailResponseEntity entity) {
    return PostDetailResponse(
        postReplies: PostReplies.fromEntity(entity.postReplies),
        users: entity.users.map(
            (key, value) => MapEntry(key, PostUser.fromEntity(entity: value))));
  }
}

@JsonSerializable(explicitToJson: true)
class PostDetailResponseEntity {
  @JsonKey(name: 'post')
  final PostRepliesEntity postReplies;
  final Map<String, PostUserEntity> users;
  PostDetailResponseEntity({
    required this.postReplies,
    required this.users,
  });
  factory PostDetailResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$PostDetailResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostDetailResponseEntityToJson(this);
}
