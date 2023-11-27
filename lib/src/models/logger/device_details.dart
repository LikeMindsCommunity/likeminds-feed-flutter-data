import 'package:json_annotation/json_annotation.dart';

part 'device_details.g.dart';

@JsonSerializable()
class DeviceDetails {
  String os;
  @JsonKey(name: 'version_os')
  String versionOS;
  @JsonKey(name: 'device_name')
  String deviceName;
  @JsonKey(name: 'screen_height')
  int screenHeight;
  @JsonKey(name: 'screen_width')
  int screenWidth;
  bool wifi;

  DeviceDetails({
    required this.os,
    required this.versionOS,
    required this.deviceName,
    required this.screenHeight,
    required this.screenWidth,
    required this.wifi,
  });

  factory DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDetailsToJson(this);
}

class DeviceDetailsBuilder {
  String? _os;
  String? _versionOS;
  String? _deviceName;
  int? _screenHeight;
  int? _screenWidth;
  bool? _wifi;

  void os(String os) {
    _os = os;
  }

  void versionOS(String versionOS) {
    _versionOS = versionOS;
  }

  void deviceName(String deviceName) {
    _deviceName = deviceName;
  }

  void screenHeight(int screenHeight) {
    _screenHeight = screenHeight;
  }

  void screenWidth(int screenWidth) {
    _screenWidth = screenWidth;
  }

  void wifi(bool wifi) {
    _wifi = wifi;
  }

  DeviceDetails build() {
    if (_os == null) throw Exception('os is required');
    if (_versionOS == null) throw Exception('versionOS is required');
    if (_deviceName == null) throw Exception('deviceName is required');
    if (_screenHeight == null) throw Exception('screenHeight is required');
    if (_screenWidth == null) throw Exception('screenWidth is required');
    if (_wifi == null) throw Exception('wifi is required');

    return DeviceDetails(
      os: _os!,
      versionOS: _versionOS!,
      deviceName: _deviceName!,
      screenHeight: _screenHeight!,
      screenWidth: _screenWidth!,
      wifi: _wifi!,
    );
  }
}
