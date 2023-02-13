import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'API_KEY')
  static const apiKey = _EnvDev.apiKey;
  @EnviedField(varName: 'BOT_ID')
  static const botId = _EnvDev.botId;
  @EnviedField(varName: 'CARAVAN_HOST')
  static const caravanHost = _EnvDev.caravanHost;
  @EnviedField(varName: 'KETTLE_HOST')
  static const kettleHost = _EnvDev.kettleHost;
  @EnviedField(varName: 'BUCKET_NAME')
  static const bucketName = _EnvDev.bucketName;
  @EnviedField(varName: 'POOL_ID')
  static const poolId = _EnvDev.poolId;
}

@Envied(path: '.env.prod')
abstract class EnvProd {
  @EnviedField(varName: 'API_KEY')
  static const apiKey = _EnvProd.apiKey;
  @EnviedField(varName: 'BOT_ID')
  static const botId = _EnvProd.botId;
  @EnviedField(varName: 'CARAVAN_HOST')
  static const caravanHost = _EnvProd.caravanHost;
  @EnviedField(varName: 'KETTLE_HOST')
  static const kettleHost = _EnvProd.kettleHost;
  @EnviedField(varName: 'BUCKET_NAME')
  static const bucketName = _EnvProd.bucketName;
  @EnviedField(varName: 'POOL_ID')
  static const poolId = _EnvProd.poolId;
}
