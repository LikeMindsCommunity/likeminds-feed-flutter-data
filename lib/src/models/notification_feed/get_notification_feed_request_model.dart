class GetNotificationFeedRequest {
  final int page;
  final int pageSize;

  GetNotificationFeedRequest._({required this.page, required this.pageSize});

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
    };
  }
}

class GetNotificationFeedRequestBuilder {
  int? _page;
  int? _pageSize;

  GetNotificationFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetNotificationFeedRequest build() {
    if (_page == null) {
      throw Exception('Page can\'t be null');
    }
    if (_pageSize == null) {
      throw Exception('Page size can\'t be null');
    }
    return GetNotificationFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
