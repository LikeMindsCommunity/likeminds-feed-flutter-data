import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/notification_feed_service.dart';

class NotificationFeedRepository {
  final NotificationFeedService notificationFeedService;

  NotificationFeedRepository({required this.notificationFeedService});

  Future<GetNotificationFeedResponse> getNotificationFeed(
      GetNotificationFeedRequest request) async {
    final entity = await notificationFeedService.getNotificationFeed(request);
    return GetNotificationFeedResponse.fromEntity(entity);
  }

  Future<MarkReadNotificationResponse> markReadNotification(
      MarkReadNotificationRequest request) async {
    final entity = await notificationFeedService.markReadNotification(request);
    return MarkReadNotificationResponse.fromEntity(entity);
  }

  Future<GetUnreadNotificationCountResponse>
      getUnreadNotificationCount() async {
    final entity = await notificationFeedService.getUnreadNotificationCount();
    return GetUnreadNotificationCountResponse.fromEntity(entity);
  }
}
