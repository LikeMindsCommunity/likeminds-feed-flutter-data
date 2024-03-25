import 'package:realm/realm.dart';

part 'community_conf_db.g.dart';

@RealmModel()
class _LMCommunityConfigurationRO {
  late final String? description;
  @PrimaryKey()
  late final String? type;
  late final String? value;
}
