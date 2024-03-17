import 'dart:convert';

import 'package:likeminds_feed/src/models/cache/cache.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_db.dart';

class CacheInterface {
  static LMCache toCache(CacheRO cache) {
    Map<String, dynamic> value =
        jsonDecode(cache.value) as Map<String, dynamic>;

    return (LMCacheBuilder()
          ..key(cache.key)
          ..value(value))
        .build();
  }

  static CacheRO fromCache(LMCache cache) {
    return CacheRO(cache.key, jsonEncode(cache.value));
  }
}
