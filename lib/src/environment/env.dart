import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'PLATFORM_CODE')
  static const platformCode = _EnvDev.platformCode;
  @EnviedField(varName: 'VERSION_CODE')
  static const int versionCode = _EnvDev.versionCode;
  @EnviedField(varName: 'KETTLE_HOST')
  static const kettleHost = _EnvDev.kettleHost;
  @EnviedField(varName: 'BUCKET_NAME', obfuscate: true)
  static final bucketName = _EnvDev.bucketName;
  @EnviedField(varName: 'POOL_ID', obfuscate: true)
  static final poolId = _EnvDev.poolId;
  @EnviedField(varName: "X_SDK_SOURCE")
  static const xSDKSource = _EnvDev.xSDKSource;
}

@Envied(path: '.env.prod')
abstract class EnvProd {
  @EnviedField(varName: 'PLATFORM_CODE')
  static const platformCode = _EnvProd.platformCode;
  @EnviedField(varName: 'VERSION_CODE')
  static const int versionCode = _EnvProd.versionCode;
  @EnviedField(varName: 'KETTLE_HOST')
  static const kettleHost = _EnvProd.kettleHost;
  @EnviedField(varName: 'BUCKET_NAME', obfuscate: true)
  static final bucketName = _EnvProd.bucketName;
  @EnviedField(varName: 'POOL_ID', obfuscate: true)
  static final poolId = _EnvProd.poolId;
  @EnviedField(varName: "X_SDK_SOURCE")
  static const xSDKSource = _EnvProd.xSDKSource;
}
