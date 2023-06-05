import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_notification_feed_response_model.g.dart';

class GetNotificationFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<NotificationFeedItem>? items;

  GetNotificationFeedResponse({
    required this.success,
    this.errorMessage,
    this.items,
  });

  factory GetNotificationFeedResponse.fromEntity(
      GetNotificationFeedResponseEntity entity) {
    return GetNotificationFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      items:
          entity.items?.map((e) => NotificationFeedItem.fromEntity(e)).toList(),
    );
  }

  GetNotificationFeedResponseEntity toEntity() {
    return GetNotificationFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      items: items?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetNotificationFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<NotificationFeedItemEntity>? items;

  GetNotificationFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.items,
  });

  factory GetNotificationFeedResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetNotificationFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetNotificationFeedResponseEntityToJson(this);
}
