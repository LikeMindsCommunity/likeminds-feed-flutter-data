import 'dart:convert';

import 'package:likeminds_feed/src/models/cache/cache.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_hive.dart';

class LMCacheDBInterface {
  static LMCache toCache(LMCacheDB cache) {
    dynamic value = jsonDecode(cache.value);

    return (LMCacheBuilder()
          ..key(cache.key)
          ..value(value))
        .build();
  }

  static LMCacheDB fromCache(LMCache cache) {
    return LMCacheDB(
      key: cache.key,
      value: jsonEncode(cache.value),
    );
  }
}
