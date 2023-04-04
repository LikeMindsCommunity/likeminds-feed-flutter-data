class AddCommentReplyRequest {
  final String text;
  final String postId;
  final String commentId;

  AddCommentReplyRequest._({
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

class AddCommentReplyRequestBuilder {
  String? _text;
  String? _postId;
  String? _commentId;

  AddCommentReplyRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void commentId(String commentId) {
    _commentId = commentId;
  }

  AddCommentReplyRequest build() {
    return AddCommentReplyRequest._(
      text: _text!,
      postId: _postId!,
      commentId: _commentId!,
    );
  }
}
