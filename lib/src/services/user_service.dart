import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

abstract class IUserService {
  Future<GetUserFeedMetaResponseEntity> getUserFeedMeta(
      GetUserFeedMetaRequest request);
  Future<LMResponse<GetBlockedUsersResponseEntity>> getBlockedUsers(
      GetBlockedUsersRequest request);
  Future<LMResponse<void>> blockUser(BlockUserRequest request);
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

  @override
  Future<LMResponse<GetBlockedUsersResponseEntity>> getBlockedUsers(
      GetBlockedUsersRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.blockUserEndpoint(request.userUUID),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      if (response.data != null && response.data['success'] == true) {
        return LMResponse.success(
            data: GetBlockedUsersResponseEntity.fromJson(response.data));
      } else {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  @override
  Future<LMResponse<void>> blockUser(BlockUserRequest request) async {
    try {
      final response = await apiClient.client().put(
            apiClient.getEndpoints.blockUserEndpoint(request.blockUserUUID),
            data: request.toJson(),
            options: Options(
              headers: {
                'Authorization': '${apiClient.accessToken}',
              },
            ),
          );
      if (response.data != null && response.data['success'] == true) {
        return LMResponse.success(data: null);
      } else {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      String? errorMessage;
      LMFeedPersistence.instance.handleException(e, stacktrace);
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
