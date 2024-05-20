import 'package:hive/hive.dart';

part 'cache_hive.g.dart'; // This line is required for Hive code generation

@HiveType(typeId: 1) // Replace 1 with a unique ID for your model
class CacheHive extends HiveObject {
  @override
  @HiveField(0)
  String key;

  @HiveField(1)
  String value;

  CacheHive({
    required this.key,
    required this.value,
  });
}
