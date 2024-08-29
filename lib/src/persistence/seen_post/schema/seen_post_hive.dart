// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'seen_post_hive.g.dart';

@HiveType(typeId: 50)
class LMSeenPostDB extends HiveObject {
  @HiveField(0)
  List<String> seenPostIDs;

  LMSeenPostDB({
    required this.seenPostIDs,
  });
}
