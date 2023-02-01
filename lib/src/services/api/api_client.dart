// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:feed_sdk/src/services/api/access_service.dart';
import 'package:flutter/foundation.dart';

import 'package:feed_sdk/src/services/api/log_interceptor.dart';

class ApiClient {
  final String feedUrl = 'https://betaauth.likeminds.community/feed';
  final String apiKey;
  String? accessToken;
  String? refreshToken;

  String? userId;
  int? communityId;

  ApiClient({required this.apiKey});

  void initTokens(String accessToken, String refreshToken) {
    print('Tokens Initiated $accessToken');
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

}
