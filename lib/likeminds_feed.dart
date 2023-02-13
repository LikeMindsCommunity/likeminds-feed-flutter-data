library likeminds_feed;

export 'src/methods/sdk.dart';
export 'src/methods/methods.dart';
export 'src/models/models.dart';

import 'package:likeminds_feed/src/di/di_service.dart';
import 'package:likeminds_feed/src/methods/callback.dart';
import 'package:likeminds_feed/src/methods/sdk.dart';

class LMClient {
  static SdkApplication initiateLikeMinds({
    required String apiKey,
    required bool isProduction,
    required LMSdkCallback sdkCallback,
  }) {
    DIService.instance.init(apiKey, isProduction, sdkCallback);
    SdkApplication sdkApplication = SdkApplication();
    return sdkApplication;
  }
}
