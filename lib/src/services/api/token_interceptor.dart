import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
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
    if (response.statusCode == 401) {
      if (!response.requestOptions.path.contains("user/refresh")) {
        debugPrint("Authenticated request failed LTM in response");

        await refreshToken();
        // final newRes = await _retry(response.requestOptions);
        return super.onResponse(response, handler);
      } else {
        debugPrint("Authenticated request failed RTM in response");
        apiClient.clearTokens();
        UpdateTokenRequest? request =
            await callback?.onRefreshTokenExpired.call();
        if (request != null) {
          apiClient.updateTokens(request.accessToken, request.refreshToken);
        }
        return super.onResponse(response, handler);
      }
    } else {
      debugPrint("Authenticated request completed pew pew");
      return super.onResponse(response, handler);
    }
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
        UpdateTokenRequest? request =
            await callback?.onRefreshTokenExpired.call();
        if (request != null) {
          apiClient.updateTokens(request.accessToken, request.refreshToken);
        }
        // final newRes = await _retry(apiClient.client(), err.requestOptions);
        // handler.resolve(newRes);
        handler.resolve(Response(requestOptions: err.requestOptions, data: {
          "success": true,
          "data": {
            "access_token": request!.accessToken,
            "refresh_token": request.refreshToken
          }
        }));
      }
    } else {
      debugPrint("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    debugPrint("Refreshing token");
    final refreshToken = apiClient.getRefreshToken;
    final response = await AuthService(apiClient: apiClient).refreshAccessToken(
        (RefreshRequestBuilder()..refreshToken(refreshToken!)).build());

    if (response.success) {
      final newAccessToken = response.accessToken;
      final newRefreshToken = response.refreshToken;
      apiClient.updateTokens(
        newAccessToken!,
        newRefreshToken!,
      );
      callback?.onAccessTokenExpired.call(
        newAccessToken,
        newRefreshToken,
      );
    } else if (response.success == false) {
      debugPrint("Invalid RTM in refreshToken");
      UpdateTokenRequest? request =
          await callback?.onRefreshTokenExpired.call();
      if (request != null) {
        apiClient.updateTokens(request.accessToken, request.refreshToken);
        return;
      }
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
