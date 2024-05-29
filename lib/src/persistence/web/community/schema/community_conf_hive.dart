import 'package:hive/hive.dart';

part 'community_conf_hive.g.dart';

@HiveType(typeId: 20)
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
