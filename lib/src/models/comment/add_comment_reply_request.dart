class AddCommentReplyRequest {
  final String text;
  final String postId;
  final String commentId;
  final String? tempId;

  AddCommentReplyRequest._({
    required this.text,
    required this.postId,
    required this.commentId,
    this.tempId,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'temp_id': tempId,
      };
}

class AddCommentReplyRequestBuilder {
  String? _text;
  String? _postId;
  String? _commentId;
  String? _tempId;

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

  void tempId(String tempId) {
    _tempId = tempId;
  }

  AddCommentReplyRequest build() {
    return AddCommentReplyRequest._(
      text: _text!,
      postId: _postId!,
      commentId: _commentId!,
      tempId: _tempId,
    );
  }
}
