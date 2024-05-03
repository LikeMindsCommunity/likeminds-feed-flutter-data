import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  final ApiClient apiClient;
  TokenInterceptor({required this.apiClient});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      if (response.data["error_message"] == "Invalid LTM!") {
        debugPrint("Authenticated request failed LTM in response");

        await refreshToken();
        // final newRes = await _retry(response.requestOptions);
        return super.onResponse(response, handler);
      } else if (response.data["error_message"] == "Invalid RTM!") {
        debugPrint("Authenticated request failed RTM in response");
        UpdateTokenRequest? request =
            await LMFeedClient.updateRefreshToken?.call();
        if (request != null) {
          apiClient.initTokens(request.accessToken, request.refreshToken);
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
    Dio dio = Dio();
    if (err.response?.statusCode == 401) {
      if (err.response?.data["error_message"] == "Invalid LTM!") {
        debugPrint("Authenticated request failed in onError");
        await refreshToken();
        final newRes = await _retry(dio, err.requestOptions);
        handler.resolve(newRes);
      } else if (err.response?.data["error_message"] == "Invalid RTM!") {
        debugPrint("Authenticated request failed in onError");
        UpdateTokenRequest? request =
            await LMFeedClient.updateRefreshToken?.call();
        if (request != null) {
          apiClient.initTokens(request.accessToken, request.refreshToken);
        }
        final newRes = await _retry(dio, err.requestOptions);
        handler.resolve(newRes);
      }
    } else {
      debugPrint("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    debugPrint("Refreshing token");
    final refreshToken = apiClient.getRefreshToken;
    final response = await AuthService(apiClient: apiClient).refresh(
        (RefreshRequestBuilder()..refreshToken(refreshToken!)).build());

    if (response.success) {
      apiClient.initTokens(
        response.accessToken!,
        response.refreshToken!,
      );
      LMFeedClient.updateAccessTokenCallBack?.call(
        response.accessToken!,
      );
    } else if (response.errorMessage == "Invalid RTM!") {
      debugPrint("Invalid RTM in refreshToken");
      UpdateTokenRequest? request =
          await LMFeedClient.updateRefreshToken?.call();
      if (request != null) {
        apiClient.initTokens(request.accessToken, request.refreshToken);
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
