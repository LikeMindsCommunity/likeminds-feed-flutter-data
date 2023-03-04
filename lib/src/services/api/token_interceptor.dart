import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/models/models.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';
import 'package:likeminds_feed/src/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  final ApiClient apiClient;
  TokenInterceptor({required this.apiClient});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 &&
        response.data["error_message"] == "Invalid LTM!") {
      print("Authenticated request failed LTM in response");
      await refreshToken();
      // final newRes = await _retry(response.requestOptions);
      return super.onResponse(response, handler);
    } else {
      print("Authenticated request completed pew pew");
      return super.onResponse(response, handler);
    }
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    Dio dio = Dio();
    if (err.response?.statusCode == 401 &&
        err.response?.data["error_message"] == "Invalid LTM!") {
      print("Authenticated request failed in onError");
      await refreshToken();
      final newRes = await _retry(dio, err.requestOptions);
      handler.resolve(newRes);
    } else {
      print("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    print("Refreshing token");
    final refreshToken = apiClient.getRefreshToken;
    final response = await AuthService(apiClient: apiClient).refresh(
      RefreshRequest(
        refreshToken: refreshToken,
      ),
    );

    if (response.success) {
      apiClient.initTokens(
        response.accessToken!,
        response.refreshToken!,
      );
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
