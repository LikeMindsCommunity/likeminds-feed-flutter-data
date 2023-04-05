class PostDetailRequest {
  final String postId;
  final int page;
  // final int pageSize;

  PostDetailRequest._({
    required this.postId,
    required this.page,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'page': page,
      };
}

class PostDetailRequestBuilder {
  String? _postId;
  int? _page;

  PostDetailRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void page(int page) {
    _page = page;
  }

  PostDetailRequest build() {
    return PostDetailRequest._(
      postId: _postId!,
      page: _page!,
    );
  }
}
