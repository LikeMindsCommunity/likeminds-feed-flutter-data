library likeminds_feed;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';

// export 'src/me';
import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/sdk.dart';
import 'package:likeminds_feed/src/models/auth/initiate_user_request_model.dart';

class LMClient {
  static SdkApplication initiateLikeMinds(String apiKey) {
    DIService.instance.init(apiKey);
    SdkApplication sdkApplication = SdkApplication(apiKey: apiKey);
    return sdkApplication;
  }

  void logout() {}

  void initiateGroupChat() {}

  void parseDeepLink() {}
}
