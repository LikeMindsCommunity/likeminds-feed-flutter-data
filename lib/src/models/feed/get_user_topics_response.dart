import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'get_user_topics_response.g.dart';

class GetUserTopicsResponse {
  final bool success;
  final String? errorMessage;
  final Map<String, List<String>>? userTopics;
  final Map<String, Topic>? topics;
  final Map<String, User>? users;
  final Map<String, WidgetModel>? widgets;

  GetUserTopicsResponse({
    this.userTopics,
    this.topics,
    this.users,
    this.widgets,
    required this.success,
    this.errorMessage,
  });

  factory GetUserTopicsResponse.fromEntity(GetUserTopicsResponseEntity entity) {
    return GetUserTopicsResponse(
      userTopics: entity.userTopics,
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  GetUserTopicsResponseEntity toEntity() {
    return GetUserTopicsResponseEntity(
      userTopics: userTopics,
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class GetUserTopicsResponseEntity {
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;
  @JsonKey(name: 'topics')
  final Map<String, TopicEntity>? topics;
  @JsonKey(name: 'widgets')
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: "users")
  final Map<String, UserEntity>? users;
  @JsonKey(name: "success", required: true)
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;

  GetUserTopicsResponseEntity({
    this.userTopics,
    this.topics,
    this.widgets,
    required this.success,
    this.users,
    this.errorMessage,
  });

  factory GetUserTopicsResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetUserTopicsResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetUserTopicsResponseEntityToJson(this);
}
