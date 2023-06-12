class AddCommentRequest {
  final String text;
  final String postId;

  AddCommentRequest._({
    required this.text,
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'text': text,
      };
}

class AddCommentRequestBuilder {
  String? _text;
  String? _postId;

  AddCommentRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void postId(String postId) {
    _postId = postId;
  }

  AddCommentRequest build() {
    return AddCommentRequest._(
      text: _text!,
      postId: _postId!,
    );
  }
}
