// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/endpoints.dart';
import 'package:likeminds_feed/src/environment/env.dart';
import 'package:likeminds_feed/src/services/api/token_interceptor.dart';
import 'package:likeminds_feed/src/services/api/log_interceptor.dart';

/// Api client to talk to our backend.
/// Also acts as the token manager class
/// to manage access and refresh tokens
class ApiClient {
  final bool isProduction;
  late final EndPoints endPoints;

  String? accessToken;
  String? refreshToken;
  int? uuid;
  int? communityId;

  ApiClient({
    required this.isProduction,
  }) {
    endPoints = EndPoints.instance(isProduction);
  }

  set setUuid(int? uuid) => this.uuid = uuid;
  set setCommunityId(int? communityId) => this.communityId = communityId;

  int? get getUuid => uuid;
  int? get getCommunityId => communityId;
  String? get getAccessToken => accessToken;
  String? get getRefreshToken => refreshToken;
  bool get getIsProduction => isProduction;
  EndPoints get getEndpoints => endPoints;

  void initTokens(String accessToken, String refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  void clearTokens() {
    accessToken = null;
    refreshToken = null;
    setUuid = null;
    setCommunityId = null;
  }

  Dio client({bool? isRefresh}) {
    Dio dio = Dio();

    Map<String, dynamic> headers = {
      "x-platform-code": EnvDev.platformCode,
      "x-version-code": EnvDev.versionCode,
      "x-sdk-source": EnvDev.xSDKSource,
    };

    if (accessToken != null &&
            isRefresh != null &&
            !headers.containsKey('Authorization')
        ? !isRefresh
        : true) {
      headers.addAll({'Authorization': '$accessToken'});
    }

    BaseOptions options = BaseOptions(headers: headers);
    dio.options = options;
    dio.interceptors.add(Logging());
    dio.interceptors.add(TokenInterceptor(apiClient: this));
    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    return dio;
  }
}
