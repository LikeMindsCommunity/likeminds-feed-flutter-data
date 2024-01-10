import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/repositories/activity.dart';

class NotificationFeedApi {
  final NotificationFeedRepository notificationFeedRepository;

  NotificationFeedApi({required this.notificationFeedRepository});

  Future<GetNotificationFeedResponse> getNotificationFeed(
      GetNotificationFeedRequest request) async {
    return await notificationFeedRepository.getNotificationFeed(request);
  }

  Future<MarkReadNotificationResponse> markReadNotification(
      MarkReadNotificationRequest request) async {
    return await notificationFeedRepository.markReadNotification(request);
  }

  Future<GetUnreadNotificationCountResponse>
      getUnreadNotificationCount() async {
    return await notificationFeedRepository.getUnreadNotificationCount();
  }

  Future<GetUserActivityResponse> getUserActivity(
      GetUserActivityRequest request) async {
    return await notificationFeedRepository.getUserActivity(request);
  }
}
