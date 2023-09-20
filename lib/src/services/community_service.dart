import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/models/community/get_community_configurations_response_model.dart';
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
    } on DioError catch (e) {
      debugPrint("Error from get community configurations: ${e.toString()}");
      return GetCommunityConfigurationsResponseEntity(
          success: false, errorMessage: e.toString());
    }
  }
}
