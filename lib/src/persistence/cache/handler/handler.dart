import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/cache/schema/cache_hive.dart';
import 'package:likeminds_feed/src/persistence/cache/utils/utils.dart';

class LMCacheDBHandler {
  final String cacheBoxName;
  late Box<LMCacheDB> cacheBox;

  LMCacheDBHandler({required this.cacheBoxName});

  Future<LMResponse<void>> init() async {
    try {
      Hive.registerAdapter(LMCacheDBAdapter());
      cacheBox = await Hive.openBox<LMCacheDB>(cacheBoxName);

      if (cacheBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: 'Failed to open box');
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMCache cache) async {
    try {
      final cacheHiveModel = LMCacheDBInterface.fromCache(cache);
      await cacheBox.put(cacheHiveModel.key, cacheHiveModel);
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> deleteValueFromCache(String key) async {
    try {
      await cacheBox.delete(key);
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  LMResponse<LMCache> getValueFromCache(String key) {
    try {
      final cacheHiveModel = cacheBox.get(key);

      if (cacheHiveModel == null) {
        return LMResponse(success: false, errorMessage: 'Cache not found');
      }

      final cache = LMCacheDBInterface.toCache(cacheHiveModel);
      return LMResponse(success: true, data: cache);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> clearCache() async {
    try {
      await cacheBox.clear();
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }
}
