library feed_sdk;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';

// export 'src/me';
import 'package:feed_sdk/src/di/di_service.dart';
import 'package:feed_sdk/src/methods/sdk.dart';
import 'package:feed_sdk/src/models/auth/initiate_user_request_model.dart';

class LikeMindsFeedSDK {
  static SdkApplication initiateLikeMinds(String apiKey) {
    DIService.instance.init(apiKey);
    SdkApplication sdkApplication = SdkApplication(apiKey: apiKey);
    return sdkApplication;
  }

  void logout() {}

  void initiateGroupChat() {}

  void parseDeepLink() {}
}
