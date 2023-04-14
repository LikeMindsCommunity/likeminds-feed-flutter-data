class GetDeleteReasonRequest {
  final int _type;

  int get type => _type;

  GetDeleteReasonRequest._({required int type}) : _type = type;

  toJson() {
    return {
      'type': type,
    };
  }
}

class GetDeleteReasonRequestBuilder {
  int? _type;

  void type(int? type) => _type = type;

  GetDeleteReasonRequest build() {
    if (_type == null) {
      throw StateError('GetDeleteReasonRequestBuilder must set type');
    }
    return GetDeleteReasonRequest._(type: _type!);
  }
}
