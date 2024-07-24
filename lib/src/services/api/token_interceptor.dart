import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/constants/string_constants.dart';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  LMSDKCallback? callback;

  final ApiClient apiClient;
  TokenInterceptor({required this.apiClient}) {
    callback =
        DIService.getIt.isRegistered<LMSDKCallback>(instanceName: "LMCallback")
            ? DIService.getIt.get<LMSDKCallback>(instanceName: "LMCallback")
            : null;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!err.response!.requestOptions.path.contains("user/refresh")) {
        debugPrint("Authenticated request failed in onError");
        await refreshToken();
        final newRes = await _retry(apiClient.client(), err.requestOptions);
        handler.resolve(newRes);
      } else {
        apiClient.clearTokens();
        debugPrint("Authenticated request failed in onError");
        LMAuthToken? request = await callback?.onRefreshTokenExpired.call();
        if (request != null) {
          handler.resolve(Response(requestOptions: err.requestOptions, data: {
            "success": true,
            "data": {
              "access_token": request.accessToken,
              "refresh_token": request.refreshToken
            }
          }));
        } else {
          handler.reject(err);
        }
      }
    } else {
      debugPrint("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    debugPrint("Refreshing token");
    LMResponse refreshTokenResponse =
        LMFeedPersistence.instance.getCache(kRefreshToken);
    if (!refreshTokenResponse.success ||
        refreshTokenResponse.data == null ||
        refreshTokenResponse.data!.value == null) {
      throw Exception("Refresh token not found.");
    }
    String refreshToken = refreshTokenResponse.data!.value;
    final response = await AuthService(apiClient: apiClient).refreshAccessToken(
        (RefreshRequestBuilder()..refreshToken(refreshToken)).build());
    if (response.success) {
      final newAccessToken = response.accessToken;
      final newRefreshToken = response.refreshToken;
      await apiClient.updateTokens(
        newAccessToken!,
        newRefreshToken!,
      );
      callback?.onAccessTokenExpiredAndRefreshed.call(
        newAccessToken,
        newRefreshToken,
      );
    } else {
      apiClient.clearTokens();
      throw Exception("Token refresh failed");
    }
  }

  Future<Response<dynamic>> _retry(
      Dio dio, RequestOptions requestOptions) async {
    final options = Options(method: requestOptions.method, headers: {
      'Authorization': apiClient.getAccessToken,
    });
    return await dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
