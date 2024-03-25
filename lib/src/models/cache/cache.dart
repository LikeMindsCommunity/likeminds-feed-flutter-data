class LMCache {
  final String key;
  final dynamic value;

  LMCache._({required this.key, required this.value});
}

class LMCacheBuilder {
  String? _key;
  dynamic _value;

  void key(String key) {
    _key = key;
  }

  void value(dynamic value) {
    _value = value;
  }

  LMCache build() {
    return LMCache._(key: _key!, value: _value!);
  }
}
