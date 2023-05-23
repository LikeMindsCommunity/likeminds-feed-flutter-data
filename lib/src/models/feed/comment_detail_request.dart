class GetCommentRequest {
  final String commentId;
  final String postId;
  final int page;
  // final int pageSize;

  GetCommentRequest._({
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

class GetCommentRequestBuilder {
  String? _commentId;
  String? _postId;
  int? _page;

  GetCommentRequestBuilder();

  void commentId(String commentId) {
    _commentId = commentId;
  }

  void page(int page) {
    _page = page;
  }

  void postId(String postId) {
    _postId = postId;
  }

  GetCommentRequest build() {
    return GetCommentRequest._(
      commentId: _commentId!,
      page: _page!,
      postId: _postId!,
    );
  }
}
