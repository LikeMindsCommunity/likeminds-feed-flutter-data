import 'package:hive/hive.dart';

part 'cache_hive.g.dart';

@HiveType(typeId: 10) // Replace 1 with a unique ID for your model
class LMCacheDB extends HiveObject {
  @override
  @HiveField(0)
  String key;

  @HiveField(1)
  String value;

  LMCacheDB({
    required this.key,
    required this.value,
  });
}
