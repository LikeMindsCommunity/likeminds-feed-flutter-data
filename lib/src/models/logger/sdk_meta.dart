import 'package:json_annotation/json_annotation.dart';

part 'sdk_meta.g.dart';

@JsonSerializable()
class LMSDKMeta {
  @JsonKey(name: 'data_layer_version')
  final String? dataLayerVersion;
  @JsonKey(name: 'core_version')
  final String? coreVersion;

  LMSDKMeta({
    this.dataLayerVersion,
    this.coreVersion,
  });

  factory LMSDKMeta.fromJson(Map<String, dynamic> json) =>
      _$LMSDKMetaFromJson(json);

  Map<String, dynamic> toJson() => _$LMSDKMetaToJson(this);
}

class LMSDKMetaBuilder {
  String? _dataLayerVersion;
  String? _coreVersion;

  void dataLayerVersion(String? dataLayerVersion) {
    _dataLayerVersion = dataLayerVersion;
  }

  void coreVersion(String? coreVersion) {
    _coreVersion = coreVersion;
  }

  LMSDKMeta build() {
    return LMSDKMeta(
      dataLayerVersion: _dataLayerVersion,
      coreVersion: _coreVersion,
    );
  }
}
