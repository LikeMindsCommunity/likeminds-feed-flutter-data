import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IUserService {
  Future<GetUserFeedMetaResponseEntity> getUserFeedMeta(
      GetUserFeedMetaRequest request);
}

class UserService implements IUserService {
  final ApiClient apiClient;

  UserService({required this.apiClient});

  @override
  Future<GetUserFeedMetaResponseEntity> getUserFeedMeta(
      GetUserFeedMetaRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserFeedMetaEndPoint(request.uuid),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );

      return GetUserFeedMetaResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetUserFeedMetaResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  Future<GetBlockedUsersResponseEntity> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getUserActivityEndpoint(request.uuid),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );

      return GetBlockedUsersResponseEntity.fromJson(response.data);
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetBlockedUsersResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
