class UniversalFeedRequest {
  final int page;
  final int pageSize;

  UniversalFeedRequest._({
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class UniversalFeedRequestBuilder {
  int? _page;
  int? _pageSize;

  UniversalFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  UniversalFeedRequest build() {
    return UniversalFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
