class CommentDetailRequest {
  final String commentId;
  final String postId;
  final int page;
  // final int pageSize;

  CommentDetailRequest._({
    required this.commentId,
    required this.page,
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'comment_id': commentId,
        'page': page,
        'post_id': postId,
      };
}

class CommentDetailRequestBuilder {
  String? _commentId;
  String? _postId;
  int? _page;

  CommentDetailRequestBuilder();

  void commentId(String commentId) {
    _commentId = commentId;
  }

  void page(int page) {
    _page = page;
  }

  void postId(String postId) {
    _postId = postId;
  }

  CommentDetailRequest build() {
    return CommentDetailRequest._(
      commentId: _commentId!,
      page: _page!,
      postId: _postId!,
    );
  }
}
