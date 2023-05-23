///Unit tests for LM Feed SDK
///To run tests, run the following command in the terminal:
///flutter test --dart-define=DEBUG=true

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

import 'environment/test_env.dart';
import 'test_callback.dart';

/// Flutter flavour/environment manager v0.0.1
const prod = !bool.fromEnvironment('DEBUG');

//Testing credentials, and callback
final TestCallback testingCallback = TestCallback();
final String testingBetaAPIKey = EnvTest.testingBetaAPIKey;
final String testingBetaBotID = EnvTest.testingBetaBotID;
final String testingProdAPIKey = EnvTest.testingProdAPIKey;
final String testingProdBotID = EnvTest.testingProdBotID;

void main() {
  debugPrint("Initiating unit tests now...");
  group('Testing LMFeedClient SDK layer\n', () {
    LMFeedClient client = (LMFeedClientBuilder()
          ..apiKey(prod ? testingProdAPIKey : testingBetaAPIKey)
          ..sdkCallback(testingCallback))
        .build();

    test('Testing Initiate User', () async {
      InitiateUserRequest request = (InitiateUserRequestBuilder()
            ..userId(prod ? testingProdBotID : testingBetaBotID))
          .build();
      InitiateUserResponse response = await client.initiateUser(request);
      expect(response, isNotNull);
      expect(
        response.initiateUser?.user.userUniqueId,
        prod ? testingProdBotID : testingBetaBotID,
      );
    });

    test('Testing Get Universal Feed', () async {
      UniversalFeedRequest request = (UniversalFeedRequestBuilder()
            ..page(1)
            ..pageSize(10))
          .build();
      UniversalFeedResponse? response = await client.getUniversalFeed(request);
      expect(response, isNotNull);
    });
  });
}
