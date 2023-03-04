// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/models/post/post_user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/post/post_model.dart';

part 'universal_feed_response.g.dart';

class UniversalFeedResponse {
  final List<Post> posts;
  final Map<String, PostUser> users;

  UniversalFeedResponse({
    required this.posts,
    required this.users,
  });

  factory UniversalFeedResponse.fromEntity(
      {required UniversalFeedResponseEntity entity}) {
    return UniversalFeedResponse(
        posts: entity.posts.map((e) => Post.fromEntity(postEntity: e)).toList(),
        users: entity.users.map(
            (key, value) => MapEntry(key, PostUser.fromEntity(entity: value))));
  }
}

@JsonSerializable(explicitToJson: true)
class UniversalFeedResponseEntity {
  final List<PostEntity> posts;
  final Map<String, PostUserEntity> users;
  UniversalFeedResponseEntity({
    required this.posts,
    required this.users,
  });
  factory UniversalFeedResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$UniversalFeedResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$UniversalFeedResponseEntityToJson(this);
}
