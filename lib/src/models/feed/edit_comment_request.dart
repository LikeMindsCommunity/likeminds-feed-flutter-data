class EditCommentRequest {
  final String text;
  final String postId;
  final String commentId;

  EditCommentRequest._({
    required this.text,
    required this.postId,
    required this.commentId,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'post_id': postId,
        'comment_id': commentId,
      };
}

class EditCommentRequestBuilder {
  String? _text;
  String? _postId;
  String? _commentId;

  EditCommentRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void commentId(String commentId) {
    _commentId = commentId;
  }

  EditCommentRequest build() {
    return EditCommentRequest._(
      text: _text!,
      postId: _postId!,
      commentId: _commentId!,
    );
  }
}
