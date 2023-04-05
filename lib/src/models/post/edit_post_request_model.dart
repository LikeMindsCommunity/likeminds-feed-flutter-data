class EditPostRequest {
  final String postId;
  final String postText;

  EditPostRequest._({
    required this.postId,
    required this.postText,
  });

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'post_text': postText,
    };
  }
}

class EditPostRequestBuilder {
  String? _postId;
  String? _postText;

  EditPostRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void postText(String postText) {
    _postText = postText;
  }

  EditPostRequest build() {
    return EditPostRequest._(
      postId: _postId!,
      postText: _postText!,
    );
  }
}
