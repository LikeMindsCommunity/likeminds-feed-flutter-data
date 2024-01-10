import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_notification_feed_response_model.g.dart';

class GetNotificationFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<NotificationFeedItem>? items;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;

  GetNotificationFeedResponse({
    required this.success,
    this.errorMessage,
    this.items,
    this.users,
    this.topics,
    this.widgets,
  });

  factory GetNotificationFeedResponse.fromEntity(
      GetNotificationFeedResponseEntity entity) {
    return GetNotificationFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      items:
          entity.items?.map((e) => NotificationFeedItem.fromEntity(e)).toList(),
      users: entity.users?.map(
        (key, value) => MapEntry(
          key,
          User.fromEntity(value),
        ),
      ),
      topics: entity.topics?.map(
        (key, value) => MapEntry(
          key,
          Topic.fromEntity(value),
        ),
      ),
      widgets: entity.widgets?.map(
        (key, value) => MapEntry(
          key,
          WidgetModel.fromEntity(value),
        ),
      ),
    );
  }

  GetNotificationFeedResponseEntity toEntity() {
    return GetNotificationFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      items: items?.map((e) => e.toEntity()).toList(),
      users: users?.map((key, value) => MapEntry(key, value.toEntity())),
      topics: topics?.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}

@JsonSerializable()
class GetNotificationFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<NotificationFeedItemEntity>? items;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;

  GetNotificationFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.items,
    this.users,
    this.topics,
    this.widgets,
  });

  factory GetNotificationFeedResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetNotificationFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetNotificationFeedResponseEntityToJson(this);
}
