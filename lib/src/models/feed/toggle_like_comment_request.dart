class ToggleLikeCommentRequest {
  final String postId;
  final String commentId;
  // final int pageSize;

  ToggleLikeCommentRequest._({
    required this.postId,
    required this.commentId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'comment_id': commentId,
      };
}

class ToggleLikeCommentRequestBuilder {
  String? _postId;
  String? _commentId;

  ToggleLikeCommentRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void commentId(String commentId) {
    _commentId = commentId;
  }

  ToggleLikeCommentRequest build() {
    return ToggleLikeCommentRequest._(
      postId: _postId!,
      commentId: _commentId!,
    );
  }
}
