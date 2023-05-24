class GetFeedRequest {
  final int page;
  final int pageSize;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;

  GetFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetFeedRequest build() {
    return GetFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
