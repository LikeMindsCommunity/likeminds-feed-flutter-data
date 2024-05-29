import 'package:hive/hive.dart';

@HiveType(typeId: 10) // Replace 1 with a unique ID for your model
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
