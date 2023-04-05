class GetPostLikesRequest {
  final String postId;
  final int? page;
  final int? pageSize;

  GetPostLikesRequest._({
    required this.postId,
    this.page,
    this.pageSize,
  });
}

class GetPostLikesRequestBuilder {
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

  GetPostLikesRequest build() {
    return GetPostLikesRequest._(
      postId: _postId!,
      page: _page,
      pageSize: _pageSize,
    );
  }
}
