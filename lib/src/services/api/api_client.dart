// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:feed_sdk/src/services/api/log_interceptor.dart';

class ApiClient {
  final String feedUrl = 'https://betaauth.likeminds.community/feed';
  String? accessToken;
  String? refreshToken;

  void initTokens(String accessToken, String refreshToken) {
    print('Tokens Initiated $accessToken');
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  final int pageLimit = 10;
  Dio client() {
    Map<String, dynamic>? headers;
    if (accessToken != null) {
      headers = {'Authorization': 'Bearer Token $accessToken'};
    }

    BaseOptions options = new BaseOptions(headers: headers);
    return Dio(options)..interceptors.add(Logging());
  }

  String getUniversalFeedEndPoint(int page) {
    return "$feedUrl/universal?page=$page";
  }

  String getPostEndPoint(String postId, int page) {
    return "$feedUrl/post/?page=$page";
  }
}
