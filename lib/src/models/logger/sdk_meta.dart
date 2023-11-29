import 'package:json_annotation/json_annotation.dart';

part 'sdk_meta.g.dart';

@JsonSerializable()
class LMSDKMeta {
  @JsonKey(name: 'sample_app_version')
  final String? sampleAppVersion;
  @JsonKey(name: 'ui_version')
  final String? uiVersion;
  @JsonKey(name: 'middleware_version')
  final String? middlewareVersion;

  LMSDKMeta({
    this.sampleAppVersion,
    this.uiVersion,
    this.middlewareVersion,
  });

  factory LMSDKMeta.fromJson(Map<String, dynamic> json) =>
      _$LMSDKMetaFromJson(json);

  Map<String, dynamic> toJson() => _$LMSDKMetaToJson(this);
}

class LMSDKMetaBuilder {
  String? _sampleAppVersion;
  String? _uiVersion;
  String? _middlewareVersion;

  void sampleAppVersion(String? sampleAppVersion) {
    _sampleAppVersion = sampleAppVersion;
  }

  void uiVersion(String? uiVersion) {
    _uiVersion = uiVersion;
  }

  void middlewareVersion(String middlewareVersion) {
    _middlewareVersion = middlewareVersion;
  }

  LMSDKMeta build() {
    return LMSDKMeta(
      sampleAppVersion: _sampleAppVersion,
      uiVersion: _uiVersion,
      middlewareVersion: _middlewareVersion,
    );
  }
}
