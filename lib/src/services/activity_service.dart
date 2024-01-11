import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class INotificationFeedService {
  Future<GetNotificationFeedResponseEntity> getNotificationFeed(
      GetNotificationFeedRequest request);

  Future<MarkReadNotificationResponseEntity> markReadNotification(
      MarkReadNotificationRequest request);

  Future<GetUnreadNotificationCountResponseEntity> getUnreadNotificationCount();
  Future<GetUserActivityResponseEntity> getUserActivity(
      GetUserActivityRequest request);
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
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetNotificationFeedResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
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
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return MarkReadNotificationResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
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
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetUnreadNotificationCountResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<GetUserActivityResponseEntity> getUserActivity(
      GetUserActivityRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserActivityEndpoint(request.uuid),
            queryParameters: request.toJson(),
             options: Options(
              headers: {'Authorization': '${apiClient.accessToken}'},
            ),
          );
      final entity = GetUserActivityResponseEntity.fromJson(response.data);
      return entity;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedLogger.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetUserActivityResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
