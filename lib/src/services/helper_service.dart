import 'package:dio/dio.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class HelperService {
  late final LMSdkCallback callback;
  final ApiClient apiClient;

  HelperService({required this.apiClient}) {
    callback = DIService.getIt.get<LMSdkCallback>(
      instanceName: "LMCallback",
    );
  }

  Future<TagResponseModelEntity> getTags({
    int? feedroomId,
    int? page,
    int? pageSize,
    String? searchQuery,
  }) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.tagsEndpoint,
        options: Options(
          headers: {
            'x-api-key': '${apiClient.getApiKey}',
          },
        ),
        queryParameters: {
          'feedroom_id': feedroomId,
          'page': page,
          'page_size': pageSize,
          'search_query': searchQuery,
        },
      );
      print("Response from get tags: ${response.data}");
      if (response.data['success'] == true) {
        return TagResponseModelEntity.fromJson(response.data);
      } else {
        return TagResponseModelEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      print("Error from get tags: $e");
      return TagResponseModelEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  void routeProfilePage(String userId) {
    callback.profileRouteCallback(lmUserId: userId);
  }
}
