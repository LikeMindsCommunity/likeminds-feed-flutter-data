// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_detail_response.g.dart';

class PostDetailResponse {
  final PostReplies postReplies;
  final Map<String, User> users;
  PostDetailResponse({
    required this.postReplies,
    required this.users,
  });
  factory PostDetailResponse.fromEntity(PostDetailResponseEntity entity) {
    return PostDetailResponse(
        postReplies: PostReplies.fromEntity(entity.postReplies),
        users: entity.users
            .map((key, value) => MapEntry(key, User.fromEntity(value))));
  }
}

@JsonSerializable(explicitToJson: true)
class PostDetailResponseEntity {
  @JsonKey(name: 'post')
  final PostRepliesEntity postReplies;
  final Map<String, UserEntity> users;
  PostDetailResponseEntity({
    required this.postReplies,
    required this.users,
  });
  factory PostDetailResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$PostDetailResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$PostDetailResponseEntityToJson(this);
}
