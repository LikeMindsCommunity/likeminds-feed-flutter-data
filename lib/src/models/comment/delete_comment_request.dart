class DeleteCommentRequest {
  final String commentId;
  final String postId;
  final String reason;

  DeleteCommentRequest._({
    required this.commentId,
    required this.postId,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        'delete_reason': reason,
      };
}

class DeleteCommentRequestBuilder {
  String? _commentId;
  String? _postId;
  String? _reason;

  DeleteCommentRequestBuilder();

  void commentId(String commentId) {
    _commentId = commentId;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void reason(String reason) {
    _reason = reason;
  }

  DeleteCommentRequest build() {
    return DeleteCommentRequest._(
      commentId: _commentId!,
      postId: _postId!,
      reason: _reason!,
    );
  }
}
