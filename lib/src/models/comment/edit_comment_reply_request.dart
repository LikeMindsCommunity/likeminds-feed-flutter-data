class EditCommentReplyRequest {
  final String text;
  final String postId;
  final String commentId;
  final String replyId;

  EditCommentReplyRequest._({
    required this.text,
    required this.postId,
    required this.commentId,
    required this.replyId,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
      };
}

class EditCommentReplyRequestBuilder {
  String? _text;
  String? _postId;
  String? _commentId;
  String? _replyId;

  EditCommentReplyRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void commentId(String commentId) {
    _commentId = commentId;
  }

  void replyId(String replyId) {
    _replyId = replyId;
  }

  EditCommentReplyRequest build() {
    return EditCommentReplyRequest._(
      text: _text!,
      postId: _postId!,
      commentId: _commentId!,
      replyId: _replyId!,
    );
  }
}
