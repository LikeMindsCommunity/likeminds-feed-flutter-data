class GetPostRequest {
  final String postId;
  final int page;
  final int pageSize;

  GetPostRequest._({
    required this.postId,
    required this.page,
    required this.pageSize,
  });
}

class GetPostRequestBuilder {
  String? _postId;
  int? _page;
  int? _pageSize;

  void postId(String postId) {
    _postId = postId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetPostRequest build() {
    return GetPostRequest._(
      postId: _postId!,
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
