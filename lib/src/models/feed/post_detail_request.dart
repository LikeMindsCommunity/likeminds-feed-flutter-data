class PostDetailRequest {
  final String postId;
  final int page;
  final int? pageSize;

  PostDetailRequest._({
    required this.postId,
    required this.page,
    this.pageSize,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'page': page,
        'page_size': pageSize,
      };
}

class PostDetailRequestBuilder {
  String? _postId;
  int? _page;
  int? _pageSize;

  PostDetailRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  PostDetailRequest build() {
    return PostDetailRequest._(
      postId: _postId!,
      page: _page!,
      pageSize: _pageSize,
    );
  }
}
