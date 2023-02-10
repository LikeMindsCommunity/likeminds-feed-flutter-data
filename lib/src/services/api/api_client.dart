// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:likeminds_feed/src/endpoints.dart';
import 'package:likeminds_feed/src/services/access_service.dart';
import 'package:likeminds_feed/src/services/api/token_interceptor.dart';
import 'package:likeminds_feed/src/services/api/log_interceptor.dart';

class ApiClient {
  final String apiKey;
  final bool isProduction;
  late final EndPoints endPoints;
  String? accessToken;
  String? refreshToken;

  String? userId;
  int? communityId;

  ApiClient({
    required this.apiKey,
    required this.isProduction,
  }) {
    endPoints = EndPoints.instance(isProduction);
  }

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
  EndPoints get getEndpoints => endPoints;

  Dio client({bool? isRefresh}) {
    Dio dio = Dio();

    Map<String, dynamic>? headers = {
      'x-platform-code': 'an',
      // 'x-version-code': '210'
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
