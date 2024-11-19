import 'package:likeminds_feed/src/models/post/post_model.dart';

class SaveTemporaryPostRequest {
  final Post tempPost;

  SaveTemporaryPostRequest._({required this.tempPost});
}

class SaveTemporaryPostRequestBuilder {
  Post? _tempPost;

  SaveTemporaryPostRequestBuilder();

  void tempPost(Post tempPost) {
    _tempPost = tempPost;
  }

  SaveTemporaryPostRequest build() {
    return SaveTemporaryPostRequest._(tempPost: _tempPost!);
  }
}
