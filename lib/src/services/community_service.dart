import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class CommunityService {
  final ApiClient apiClient;

  CommunityService({required this.apiClient});

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<GetCommunityConfigurationsResponseEntity>
      getCommunityConfigurations() async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.communityConfigurationsEndpoint,
          );

      final communityConfigurations =
          GetCommunityConfigurationsResponseEntity.fromJson(response.data);

      return communityConfigurations;
    } on DioException catch (e, stacktrace) {
      debugPrint("Dio error: $e");
      LMFeedPersistence.instance.handleException(e, stacktrace);

      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetCommunityConfigurationsResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  Future<LMResponse<ConnectionMetaResponseEntity>> connectionMeta(
      ConnectionMetaRequest request) async {
    try {
      final response = await apiClient.client().get(
            apiClient.getEndpoints.getConnectionMetaEndpoint(request.userUUID),
          );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
      final connectionMetaResponse =
          ConnectionMetaResponseEntity.fromJson(response.data['data']);

      return LMResponse.success(data: connectionMetaResponse);
    } on DioException catch (e, stacktrace) {
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
          errorMessage: errorMessage ??
              "An error occurred while fetching connection meta");
    }
  }

  Future<LMResponse<void>> sendConnection(SendConnectionRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.getEndpoints.getConnectionEndpoint(request.receiverUUID),
            data: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
      return LMResponse.success(data: null);
    } on DioException catch (e, stacktrace) {
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
          errorMessage: errorMessage ??
              "An error occurred while sending connection request");
    }
  }

  Future<LMResponse<void>> updateConnection(
      UpdateConnectionRequest request) async {
    try {
      final response = await apiClient.client().patch(
            apiClient.getEndpoints.getConnectionEndpoint(request.receiverUUID),
            data: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(errorMessage: response.data['error_message']);
      }
      return LMResponse.success(data: null);
    } on DioException catch (e, stacktrace) {
      LMFeedPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse.error(
          errorMessage: errorMessage ??
              "An error occurred while updating connection request");
    }
  }
}
