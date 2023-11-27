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
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return GetTaggingListResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
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

      return DecodeUrlResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Error from get tags: $e");
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return DecodeUrlResponseEntity(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }

  void routeProfilePage(String userId) {
    callback?.profileRouteCallback(lmUserId: userId);
  }

  void routeCompanyPage(String companyId) {
    callback?.routeToCompanyCallback(companyId: companyId);
  }
}
