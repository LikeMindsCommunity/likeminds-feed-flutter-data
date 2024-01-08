import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_user_activity_response_model.g.dart';

class GetUserActivityResponse {
  final bool success;
  final String? errorMessage;
  final List<UserActivityItem>? activities;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;

  GetUserActivityResponse({
    required this.success,
    required this.errorMessage,
    required this.activities,
    required this.users,
    required this.topics,
    required this.widgets,
  });

  factory GetUserActivityResponse.fromEntity(
      GetUserActivityResponseEntity entity) {
    return GetUserActivityResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      activities: entity.activities
          ?.map((e) => UserActivityItem.fromEntity(e))
          .toList(),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
    );
  }

  GetUserActivityResponseEntity toEntity() {
    return GetUserActivityResponseEntity(
      success: success,
      errorMessage: errorMessage,
      activities: activities?.map((e) => e.toEntity()).toList(),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}

@JsonSerializable()
class GetUserActivityResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<UserActivityItemEntity>? activities;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;

  GetUserActivityResponseEntity({
    required this.success,
    this.errorMessage,
    this.activities,
    this.users,
    this.topics,
    this.widgets,
  });

  factory GetUserActivityResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserActivityResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserActivityResponseEntityToJson(this);
}
