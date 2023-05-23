import 'package:flutter/foundation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

class TestCallback extends LMSDKCallback {
  @override
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap) {
    debugPrint("Unit testing; eventFiredCallback: $eventKey, $propertiesMap");
  }

  @override
  void loginRequiredCallback() {
    debugPrint("Unit testing; loginRequiredCallback");
  }

  @override
  void logoutCallback() {
    debugPrint("Unit testing; logoutCallback");
  }
}
