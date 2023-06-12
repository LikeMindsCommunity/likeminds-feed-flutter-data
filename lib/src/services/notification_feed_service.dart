import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class INotificationFeedService {
  Future<GetNotificationFeedResponseEntity> getNotificationFeed(
      GetNotificationFeedRequest request);
  Future<MarkReadNotificationResponseEntity> markReadNotification(
      MarkReadNotificationRequest request);
  Future<GetUnreadNotificationCountResponseEntity> getUnreadNotificationCount();
}

class NotificationFeedService implements INotificationFeedService {
  final ApiClient apiClient;

  NotificationFeedService({required this.apiClient});

  @override
  Future<GetNotificationFeedResponseEntity> getNotificationFeed(
      GetNotificationFeedRequest request) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.getNotificationFeedEndpoint,
        queryParameters: {
          'page': request.page,
          'page_size': request.pageSize,
        },
      );
      final entity = GetNotificationFeedResponseEntity.fromJson(response.data);
      return entity;
    } on DioError catch (e) {
      return GetNotificationFeedResponseEntity(
        errorMessage: e.message,
        success: false,
      );
    }
  }

  @override
  Future<MarkReadNotificationResponseEntity> markReadNotification(
      MarkReadNotificationRequest request) async {
    try {
      final response = await apiClient.client().post(
        apiClient.getEndpoints.markReadNotificationEndpoint(request.activityId),
        data: {
          'activity_id': request.activityId,
        },
      );
      final entity = MarkReadNotificationResponseEntity.fromJson(response.data);
      return entity;
    } on DioError catch (e) {
      return MarkReadNotificationResponseEntity(
        errorMessage: e.message,
        success: false,
      );
    }
  }

  @override
  Future<GetUnreadNotificationCountResponseEntity>
      getUnreadNotificationCount() async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUnreadNotificationCountEndpoint,
          );
      final entity =
          GetUnreadNotificationCountResponseEntity.fromJson(response.data);
      return entity;
    } on DioError catch (e) {
      return GetUnreadNotificationCountResponseEntity(
        errorMessage: e.message,
        success: false,
      );
    }
  }
}
