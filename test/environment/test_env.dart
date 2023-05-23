import 'package:envied/envied.dart';

part 'test_env.g.dart';

@Envied(path: 'test/.env.test')
abstract class EnvTest {
  @EnviedField(varName: 'TESTING_BETA_API_KEY')
  static const testingBetaAPIKey = _EnvTest.testingBetaAPIKey;
  @EnviedField(varName: 'TESTING_BETA_BOT_ID')
  static const testingBetaBotID = _EnvTest.testingBetaBotID;
  @EnviedField(varName: 'TESTING_PROD_API_KEY')
  static const testingProdAPIKey = _EnvTest.testingProdAPIKey;
  @EnviedField(varName: 'TESTING_PROD_BOT_ID')
  static const testingProdBotID = _EnvTest.testingProdBotID;
}
