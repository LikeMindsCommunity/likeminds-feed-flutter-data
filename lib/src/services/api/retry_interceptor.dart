import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/src/services/api/api_client.dart';

class RetryInterceptor extends Interceptor {
  final ApiClient apiClient;
  final int maxRetries;

  RetryInterceptor({required this.apiClient, this.maxRetries = 3});

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is retryable and we should retry
    if (_shouldRetry(err) && _isRetryable(err)) {
      var retryCount = err.requestOptions.extra['retryCount'] ?? 0;

      // Increment the retry count
      retryCount++;

      if (retryCount <= maxRetries) {
        // Calculate exponential backoff delay: 1s, 2s, 4s...
        final retryDelay = Duration(seconds: 1 << (retryCount - 1));
        debugPrint(
            'Retrying request: Attempt $retryCount with delay: ${retryDelay.inSeconds} seconds.');

        await Future.delayed(retryDelay);

        // Update retry count in request options
        err.requestOptions.extra['retryCount'] = retryCount;

        try {
          // Retry the API call using _retry method from TokenInterceptor
          final newResponse =
              await _retry(apiClient.client(), err.requestOptions);
          return handler.resolve(newResponse);
        } on DioException catch (e) {
          return handler.reject(e);
        }
      }
    }

    // If retries are exhausted or the error is not retryable, return the error
    return handler.next(err);
  }

  // Retry logic for retryable requests
  Future<Response<dynamic>> _retry(
      Dio dio, RequestOptions requestOptions) async {
    Map<String, dynamic> headers = requestOptions.headers;
    headers['Authorization'] = apiClient.accessToken; // Ensure valid token

    final options = Options(
      method: requestOptions.method,
      headers: headers,
      extra: requestOptions.extra,
    );

    return await dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  // Determine if the error is retryable based on the status codes
  bool _isRetryable(DioException err) {
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      final statusCode = err.response!.statusCode;
      return [500, 502, 503, 504, 408, 429].contains(statusCode);
    }
    return false;
  }

  // Optional: You can add other checks for whether to retry (e.g., network issues)
  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.connectionTimeout &&
        err.type != DioExceptionType.connectionError;
  }
}
