// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'universal_feed_response.g.dart';

class GetFeedResponse {
  final List<Post> posts;
  final Map<String, User> users;
  final Map<String, Topic> topics;
  final Map<String, WidgetModel> widgets;

  GetFeedResponse({
    required this.posts,
    required this.users,
    required this.topics,
    required this.widgets,
  });

  factory GetFeedResponse.fromEntity({required GetFeedResponseEntity entity}) {
    return GetFeedResponse(
      posts: entity.posts.map((e) => Post.fromEntity(postEntity: e)).toList(),
      users: entity.users
          .map((key, value) => MapEntry(key, User.fromEntity(value))),
      topics: entity.topics
          .map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          .map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetFeedResponseEntity {
  final List<PostEntity> posts;
  final Map<String, UserEntity> users;
  final Map<String, TopicEntity> topics;
  final Map<String, WidgetModelEntity> widgets;

  GetFeedResponseEntity({
    required this.posts,
    required this.users,
    required this.topics,
    required this.widgets,
  });

  factory GetFeedResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetFeedResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetFeedResponseEntityToJson(this);
}
