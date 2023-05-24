import 'package:envied/envied.dart';

part 'test_env.g.dart';

@Envied(path: 'test/.env.test')
abstract class EnvTest {
  @EnviedField(varName: 'TESTING_BETA_API_KEY', obfuscate: true)
  static final testingBetaAPIKey = _EnvTest.testingBetaAPIKey;
  @EnviedField(varName: 'TESTING_BETA_BOT_ID', obfuscate: true)
  static final testingBetaBotID = _EnvTest.testingBetaBotID;
  @EnviedField(varName: 'TESTING_PROD_API_KEY', obfuscate: true)
  static final testingProdAPIKey = _EnvTest.testingProdAPIKey;
  @EnviedField(varName: 'TESTING_PROD_BOT_ID', obfuscate: true)
  static final testingProdBotID = _EnvTest.testingProdBotID;
}
