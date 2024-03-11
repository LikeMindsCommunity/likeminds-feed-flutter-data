class GetUserPostRequest {
  final int page;
  final int pageSize;
  final String userId;

  GetUserPostRequest._({
    required this.page,
    required this.pageSize,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetUserPostRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _userId;

  GetUserPostRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void userId(String userId) {
    _userId = userId;
  }

  GetUserPostRequest build() {
    return GetUserPostRequest._(
      page: _page!,
      pageSize: _pageSize!,
      userId: _userId!,
    );
  }
}
