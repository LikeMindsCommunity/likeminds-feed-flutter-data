import 'package:json_annotation/json_annotation.dart';

part 'notification_feed_item_model.g.dart';

class NotificationFeedItem {
  final String id;

  NotificationFeedItem({required this.id});

  factory NotificationFeedItem.fromEntity(NotificationFeedItemEntity entity) {
    return NotificationFeedItem(
      id: entity.id,
    );
  }

  NotificationFeedItemEntity toEntity() {
    return NotificationFeedItemEntity(
      id: id,
    );
  }
}

@JsonSerializable()
class NotificationFeedItemEntity {
  final String id;

  NotificationFeedItemEntity({required this.id});

  factory NotificationFeedItemEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationFeedItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationFeedItemEntityToJson(this);
}
