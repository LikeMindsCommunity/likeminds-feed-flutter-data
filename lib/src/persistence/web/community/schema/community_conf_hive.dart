import 'package:hive/hive.dart';

part 'community_conf_hive.g.dart'; // This line is required for Hive code generation

@HiveType(typeId: 1) // Replace 1 with a unique ID for your model
class LMCommunityConfigurationHive extends HiveObject {
  @HiveField(0)
  String? description;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? value;

  LMCommunityConfigurationHive({
    this.description,
    this.type,
    this.value,
  });
}
