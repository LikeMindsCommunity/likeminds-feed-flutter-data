import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_user_feed_meta_response.g.dart';

class GetUserFeedMetaResponse {
  final bool success;
  final String? errorMessage;
  final int? commentsCount;
  final int? postsCount;
  final Map<String, User>? users;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;
  final Map<String, Topic>? topics;

  GetUserFeedMetaResponse({
    required this.success,
    this.errorMessage,
    this.commentsCount,
    this.postsCount,
    this.users,
    this.widgets,
    this.userTopics,
    this.topics,
  });

  factory GetUserFeedMetaResponse.fromEntity(
      GetUserFeedMetaResponseEntity entity) {
    return GetUserFeedMetaResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      commentsCount: entity.commentsCount,
      postsCount: entity.postsCount,
      userTopics: entity.userTopics,
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      widgets: entity.widgets?.map((key, value) {
        return MapEntry(key, WidgetModel.fromEntity(value));
      }),
      topics: entity.topics?.map(
        (key, value) => MapEntry(key, Topic.fromEntity(value)),
      ),
    );
  }

  GetUserFeedMetaResponseEntity toEntity() {
    return GetUserFeedMetaResponseEntity(
      success: success,
      errorMessage: errorMessage,
      commentsCount: commentsCount,
      postsCount: postsCount,
      userTopics: userTopics,
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
    );
  }
}

@JsonSerializable()
class GetUserFeedMetaResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'comments_count')
  final int? commentsCount;
  @JsonKey(name: 'posts_count')
  final int? postsCount;
  final Map<String, UserEntity>? users;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;
  @JsonKey(name: 'topics')
  final Map<String, TopicEntity>? topics;

  GetUserFeedMetaResponseEntity({
    required this.success,
    this.errorMessage,
    this.commentsCount,
    this.postsCount,
    this.users,
    this.userTopics,
    this.widgets,
    this.topics,
  });

  factory GetUserFeedMetaResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserFeedMetaResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserFeedMetaResponseEntityToJson(this);
}
