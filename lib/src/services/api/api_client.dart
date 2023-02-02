// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/token_interceptor.dart';
import 'package:flutter/foundation.dart';

import 'package:likeminds_feed/src/services/api/log_interceptor.dart';

class ApiClient {
  final String feedUrl = 'https://betaauth.likeminds.community/feed';
  final String apiKey;
  String? accessToken;
  String? refreshToken;

  String? userId;
  int? communityId;

  ApiClient({required this.apiKey});

  void initTokens(String accessToken, String refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  set setUserId(String? userId) => this.userId = userId;
  set setCommunityId(int? communityId) => this.communityId = communityId;

  get getUserId => userId;
  get getCommunityId => communityId;
  get getAccessToken => accessToken;
  get getRefreshToken => refreshToken;
  get getApiKey => apiKey;

  final int pageLimit = 10;
  Dio client({bool? isRefresh}) {
    Dio dio = Dio();
    Map<String, dynamic>? headers;
    if (accessToken != null && isRefresh != null ? !isRefresh : true) {
      headers = {'Authorization': '$accessToken'};
    }

    BaseOptions options = BaseOptions(headers: headers);
    dio.options = options;
    dio.interceptors.add(Logging());
    dio.interceptors.add(TokenInterceptor(apiClient: this));
    return dio;
  }

  String getUniversalFeedEndPoint(int page) {
    return "$feedUrl/universal?page=$page&page_size=$pageLimit";
  }

  String getPostEndPoint(String postId, int page) {
    return "$feedUrl/post/$postId?page=$page&page_size=$pageLimit";
  }

  String getAddCommentEndPoint(String postId) {
    return "$feedUrl/post/$postId/comment";
  }

  String toggleLikeCommentEndPoint(String commentId, String postId) {
    // feed/post/<post_id>/comment/<comment_id>/like
    return "$feedUrl/post/$postId/comment/$commentId/like";
  }

  String getCommentEndPoint(String commentId, String postId, int page) {
    return "$feedUrl/post/$postId/comment/$commentId?page=$page&page_size=$pageLimit";
  }

  String addCommentReplyEndPoint(String commentId, String postId) {
    return "$feedUrl/post/$postId/comment/$commentId/comment";
  }

  Future<bool> getAccessType(String accessType) async =>
      await AccessService(apiClient: this).getAccess(accessType);

  Future<bool> getMemberState() async =>
      await AccessService(apiClient: this).getMemberState();
}
