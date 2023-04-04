class AddCommentRequest {
  final String text;
  final String postId;

  AddCommentRequest._({
    required this.text,
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'post_id': postId,
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
