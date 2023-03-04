abstract class LMSdkCallback {
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap);
  void loginRequiredCallback();
  void logoutCallback();
  void profileRouteCallback({required String lmUserId}) {}
}
