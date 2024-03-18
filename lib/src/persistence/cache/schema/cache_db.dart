import 'package:realm/realm.dart';

part 'cache_db.g.dart';

@RealmModel()
class _CacheRO {
  @PrimaryKey()
  late final String key;

  late final String value;
}
