// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:feed_sdk/src/services/api/access_service.dart';
import 'package:flutter/foundation.dart';

import 'package:feed_sdk/src/services/api/log_interceptor.dart';

class ApiClient {
  final String feedUrl = 'https://betaauth.likeminds.community/feed';
  String? accessToken;
  String? refreshToken;

  String? userId;
  String? communityId;

  void initTokens(String accessToken, String refreshToken) {
    print('Tokens Initiated $accessToken');
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  set setUserId(String? userId) => this.userId = userId;
  set setCommunityId(String? communityId) => this.communityId = communityId;

  get getUserId => userId;
  get getCommunityId => communityId;
  get getAccessToken => accessToken;
  get getRefreshToken => refreshToken;

  final int pageLimit = 10;
  Dio client() {
    Map<String, dynamic>? headers;
    if (accessToken != null) {
      print("Add post token - $accessToken");
      headers = {'Authorization': '$accessToken'};
    }

    BaseOptions options = new BaseOptions(headers: headers);
    return Dio(options)..interceptors.add(Logging());
  }

  String getUniversalFeedEndPoint(int page) {
    return "$feedUrl/universal?page=$page";
  }

  Future<bool> getAccessType(String accessType) async =>
      await AccessService(apiClient: this).getAccess(accessType);
}
