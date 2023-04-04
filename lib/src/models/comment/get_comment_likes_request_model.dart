class GetCommentLikesRequest {
  final String commentId;
  final String postId;
  final int page;
  final int pageSize;

  GetCommentLikesRequest._({
    required this.commentId,
    required this.postId,
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'post_id': postId,
      'page': page,
      'page_size': pageSize
    };
  }
}

class GetCommentLikesRequestBuilder {
  String? _commentId;
  String? _postId;
  int? _page;
  int? _pageSize;

  GetCommentLikesRequestBuilder();

  void commentId(String commentId) {
    _commentId = commentId;
  }

  void page(int page) {
    _page = page;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetCommentLikesRequest build() {
    return GetCommentLikesRequest._(
      commentId: _commentId!,
      postId: _postId!,
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
