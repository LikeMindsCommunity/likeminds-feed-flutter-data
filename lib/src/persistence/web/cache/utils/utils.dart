import 'dart:convert';

import 'package:likeminds_feed/src/models/cache/cache.dart';
import 'package:likeminds_feed/src/persistence/web/cache/schema/cache_hive.dart';

class CacheInterfaceWeb {
  static LMCache toCache(CacheHive cache) {
    dynamic value = jsonDecode(cache.value);

    return (LMCacheBuilder()
          ..key(cache.key)
          ..value(value))
        .build();
  }

  static CacheHive fromCache(LMCache cache) {
    return CacheHive(
      key: cache.key,
      value: jsonEncode(cache.value),
    );
  }
}
