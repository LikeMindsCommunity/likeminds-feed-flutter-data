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
}
