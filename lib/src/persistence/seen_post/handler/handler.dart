import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/seen_post/schema/seen_post_hive.dart';

class LMFeedSeenPostDBHandler {
  final String seenPostBoxName;
  final String seenPostIDsKey = 'seenPostIDs';
  late Box<LMSeenPostDB> _seenPostBox;

  LMFeedSeenPostDBHandler({
    required this.seenPostBoxName,
  });

  Future<LMResponse> init() async {
    try {
      final lmSeenPostDBAdapter = LMSeenPostDBAdapter();
      if (!Hive.isAdapterRegistered(lmSeenPostDBAdapter.typeId)) {
        Hive.registerAdapter(lmSeenPostDBAdapter);
      }

      _seenPostBox = await Hive.openBox<LMSeenPostDB>(seenPostBoxName);

      if (_seenPostBox.isOpen) {
        return LMResponse.success(data: null);
      } else {
        return LMResponse.error(errorMessage: 'Failed to open seen post box');
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> insertSeenPostID(List<String> seenPostIds) async {
    try {
      final seenPostIDs = _seenPostBox.get(seenPostIDsKey)?.seenPostIDs ?? [];
      seenPostIDs.addAll(seenPostIds);
      await _seenPostBox.put(
        seenPostIDsKey,
        LMSeenPostDB(seenPostIDs: seenPostIDs),
      );
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  LMResponse<List<String>> getSeenPostIDs() {
    try {
      final seenPostIDs = _seenPostBox.get(seenPostIDsKey)?.seenPostIDs ?? [];
      return LMResponse.success(data: seenPostIDs);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> clearSeenPostIDs() async {
    try {
      await _seenPostBox.delete(seenPostIDsKey);
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }
}
