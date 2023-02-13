// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/endpoints.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/token_interceptor.dart';
import 'package:likeminds_feed/src/services/api/log_interceptor.dart';

/// Api client to talk to our backend.
/// Also acts as the token manager class
/// to manage access and refresh tokens
class ApiClient {
  final String apiKey;
  final bool isProduction;
  late final EndPoints endPoints;

  String? accessToken;
  String? refreshToken;
  int? userId;
  int? communityId;

  ApiClient({
    required this.apiKey,
    required this.isProduction,
  }) {
    endPoints = EndPoints.instance(isProduction);
  }

  set setUserId(int? userId) => this.userId = userId;
  set setCommunityId(int? communityId) => this.communityId = communityId;

  get getUserId => userId;
  get getCommunityId => communityId;
  get getAccessToken => accessToken;
  get getRefreshToken => refreshToken;
  get getApiKey => apiKey;
  get getIsProduction => isProduction;
  EndPoints get getEndpoints => endPoints;

  void initTokens(String accessToken, String refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  void clearTokens() {
    accessToken = null;
    refreshToken = null;
    setUserId = null;
    setCommunityId = null;
  }

  Dio client({bool? isRefresh}) {
    Dio dio = Dio();

    Map<String, dynamic>? headers = {
      'x-platform-code': Platform.isAndroid
          ? 'an'
          : Platform.isIOS
              ? 'ios'
              : 'web',
      'x-version-code': Platform.isAndroid
          ? 210
          : Platform.isIOS
              ? 372
              : 16
    };

    if (accessToken != null && isRefresh != null ? !isRefresh : true) {
      headers.addAll({'Authorization': '$accessToken'});
    }

    BaseOptions options = BaseOptions(headers: headers);
    dio.options = options;
    dio.interceptors.add(Logging());
    dio.interceptors.add(TokenInterceptor(apiClient: this));
    return dio;
  }

  Future<bool> getAccessType(String accessType) async =>
      await AccessService(apiClient: this).getAccess(accessType);

  Future<bool> getMemberState() async =>
      await AccessService(apiClient: this).getMemberState();
}
