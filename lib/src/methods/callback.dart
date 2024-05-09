import 'package:likeminds_feed/likeminds_feed.dart';

abstract class LMSDKCallback {
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap);
  void loginRequiredCallback();
  void logoutCallback();
  void profileRouteCallback({required String uuid}) {}
  void routeToCompanyCallback({required String companyId}) {}

  void onAccessTokenExpired(String accessToken, String refreshToken);
  Future<UpdateTokenRequest> onRefreshTokenExpired();
}
