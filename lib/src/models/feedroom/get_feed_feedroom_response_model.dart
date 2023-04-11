import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_feed_feedroom_response_model.g.dart';

class GetFeedOfFeedRoomResponse {
  final bool success;
  final String? errorMessage;
  final List<Post>? posts;
  final Map<String, User> users;

  GetFeedOfFeedRoomResponse({
    required this.success,
    required this.errorMessage,
    required this.posts,
    required this.users,
  });

  factory GetFeedOfFeedRoomResponse.fromEntity(
          {required GetFeedOfFeedRoomResponseEntity entity}) =>
      GetFeedOfFeedRoomResponse(
        success: entity.success,
        errorMessage: entity.errorMessage,
        posts:
            entity.posts?.map((e) => Post.fromEntity(postEntity: e)).toList(),
        users: entity.users
            .map((key, value) => MapEntry(key, User.fromEntity(value))),
      );

  GetFeedOfFeedRoomResponseEntity toEntity() => GetFeedOfFeedRoomResponseEntity(
        success: success,
        errorMessage: errorMessage,
        posts: posts?.map((e) => e.toEntity()).toList(),
        users: users.map((key, value) => MapEntry(key, value.toEntity())),
      );
}

@JsonSerializable()
class GetFeedOfFeedRoomResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<PostEntity>? posts;
  final Map<String, UserEntity> users;

  GetFeedOfFeedRoomResponseEntity({
    required this.success,
    required this.errorMessage,
    required this.posts,
    required this.users,
  });

  factory GetFeedOfFeedRoomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedOfFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetFeedOfFeedRoomResponseEntityToJson(this);
}
