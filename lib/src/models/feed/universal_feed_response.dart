// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'universal_feed_response.g.dart';

class GetFeedResponse {
  final List<Post> posts;
  final Map<String, User> users;

  GetFeedResponse({
    required this.posts,
    required this.users,
  });

  factory GetFeedResponse.fromEntity({required GetFeedResponseEntity entity}) {
    return GetFeedResponse(
        posts: entity.posts.map((e) => Post.fromEntity(postEntity: e)).toList(),
        users: entity.users
            .map((key, value) => MapEntry(key, User.fromEntity(value))));
  }
}

@JsonSerializable(explicitToJson: true)
class GetFeedResponseEntity {
  final List<PostEntity> posts;
  final Map<String, UserEntity> users;
  GetFeedResponseEntity({
    required this.posts,
    required this.users,
  });
  factory GetFeedResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetFeedResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetFeedResponseEntityToJson(this);
}
