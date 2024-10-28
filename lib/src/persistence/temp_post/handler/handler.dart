import 'package:hive/hive.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/persistence/temp_post/schema/temp_post_hive.dart';
import 'package:likeminds_feed/src/persistence/temp_post/utils/utils.dart';

class LMFeedTempPostDBHandler {
  final String postBoxName;
  late Box<LMPostDB> postBox;
  final String tempPostKey = 'tempPost';
  LMFeedTempPostDBHandler({required this.postBoxName});

  /// Initialize the PostDBHandler by registering the adapter and opening the box
  Future<LMResponse<void>> init() async {
    try {
      Hive.registerAdapter(LMPostDBAdapter());
      Hive.registerAdapter(LMAttachmentDBAdapter());
      Hive.registerAdapter(LMAttachmentMetaDBAdapter());

      postBox = await Hive.openBox<LMPostDB>(postBoxName);

      if (postBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: "Failed to open box");
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  /// Insert a temp post in the box
  Future<LMResponse<void>> saveTemporaryPost(
      SaveTemporaryPostRequest saveTemporaryPostRequest) async {
    try {
      final Post post = saveTemporaryPostRequest.tempPost;
      final LMPostDB postDB = LMPostDBInterface.fromPost(post);
      await postBox.put(tempPostKey, postDB);
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Delete a post by temporary ID
  Future<LMResponse<void>> deleteTemporaryPost(
      DeleteTemporaryPostRequest deleteTemporaryPostRequest) async {
    try {
      String tempPostId = deleteTemporaryPostRequest.temporaryPostId;
      final result = postBox.get(tempPostKey);

      if (result == null || result.tempId != tempPostId) {
        return LMResponse<void>(
          success: false,
          errorMessage: "Post not found",
        );
      }
      await postBox.delete(tempPostKey);
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Fetch a post by ID
  LMResponse<Post> getTemporaryPost() {
    try {
      final queryResult = postBox.values;

      if (queryResult.isEmpty) {
        return LMResponse<Post>(
          success: false,
          errorMessage: "Post not found",
        );
      }

      final post = LMPostDBInterface.toPost(queryResult.first);
      return LMResponse<Post>(success: true, data: post);
    } on Exception catch (e) {
      return LMResponse<Post>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Clear all posts from the box
  Future<LMResponse<void>> clearPosts() async {
    try {
      await postBox.clear();
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
