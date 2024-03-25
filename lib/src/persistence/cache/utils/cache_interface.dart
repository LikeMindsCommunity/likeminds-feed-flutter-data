import 'dart:convert';

import 'package:likeminds_feed/src/models/cache/cache.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_db.dart';

class CacheInterface {
  static LMCache toCache(CacheRO cache) {
    dynamic value = jsonDecode(cache.value);

    return (LMCacheBuilder()
          ..key(cache.key)
          ..value(value))
        .build();
  }

  static CacheRO fromCache(LMCache cache) {
    return CacheRO(cache.key, jsonEncode(cache.value));
  }
}
