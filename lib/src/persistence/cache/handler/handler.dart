import 'package:likeminds_feed/src/models/cache/cache.dart';
import 'package:likeminds_feed/src/models/response.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_db.dart';
import 'package:likeminds_feed/src/persistence/cache/utils/cache_interface.dart';
import 'package:realm/realm.dart';

class LMCacheDBHandler {
  Configuration config;

  LMCacheDBHandler({required this.config});

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    Realm realm = Realm(config);
    try {
      CacheRO cacheDBModel = CacheInterface.fromCache(cache);

      await realm.writeAsync(() {
        realm.add(cacheDBModel, update: true);
      });

      realm.close();

      return LMResponse(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> deleteValueFromCache(String key) async {
    Realm realm = Realm(config);
    try {
      CacheRO? result = realm.find<CacheRO>(key);

      if (result == null) {
        return LMResponse(success: false, errorMessage: 'Cache not found');
      }

      await realm.writeAsync(() {
        realm.delete(result);
      });

      realm.close();

      return LMResponse(success: true);
    } on Exception catch (e) {
      realm.close();

      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  LMResponse<LMCache> getValueFromCache(String key) {
    Realm realm = Realm(config);
    try {
      CacheRO? cacheRO = realm.find<CacheRO>(key);

      if (cacheRO == null) {
        return LMResponse(success: false, errorMessage: 'Cache not found');
      }

      LMCache cache = CacheInterface.toCache(cacheRO);

      realm.close();

      return LMResponse(success: true, data: cache);
    } on Exception {
      realm.close();
      return LMResponse(success: false, errorMessage: 'Error fetching cache');
    }
  }

  Future<LMResponse<void>> clearCache() async {
    Realm realm = Realm(config);
    try {
      await realm.writeAsync(() {
        realm.deleteAll<CacheRO>();
      });

      realm.close();

      return LMResponse(success: true);
    } on Exception catch (e) {
      realm.close();
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }
}
