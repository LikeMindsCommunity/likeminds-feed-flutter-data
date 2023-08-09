import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class HelperService {
  LMSDKCallback? callback;
  final ApiClient apiClient;

  HelperService({required this.apiClient}) {
    callback =
        DIService.getIt.isRegistered<LMSDKCallback>(instanceName: "LMCallback")
            ? DIService.getIt.get<LMSDKCallback>(instanceName: "LMCallback")
            : null;
  }

  Future<GetTaggingListResponseEntity> getTaggingList(
      {required GetTaggingListRequest request}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.tagsEndpoint,
        options: Options(
          headers: {
            'x-api-key': apiClient.getApiKey,
          },
        ),
        queryParameters: {
          'feedroom_id': request.feedroomId,
          'page': request.page,
          'page_size': request.pageSize,
          'search_name': request.searchQuery,
        },
      );
      if (response.data['success'] == true) {
        return GetTaggingListResponseEntity.fromJson(response.data);
      } else {
        return GetTaggingListResponseEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      debugPrint("Error from get tags: $e");
      return GetTaggingListResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  Future<DecodeUrlResponseEntity> decodeUrl(
      {required DecodeUrlRequest request}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.getEndpoints.decodeUrlEndpoint,
        options: Options(
          headers: {
            'Authorization': '${apiClient.accessToken}',
          },
        ),
        queryParameters: {
          'url': request.url,
        },
      );
      if (response.data['success'] == true) {
        return DecodeUrlResponseEntity.fromJson(response.data);
      } else {
        return DecodeUrlResponseEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      debugPrint("Error from get tags: $e");
      return DecodeUrlResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  void routeProfilePage(String userId) {
    callback?.profileRouteCallback(lmUserId: userId);
  }
}
