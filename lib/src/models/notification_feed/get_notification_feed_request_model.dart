class GetNotificationFeedRequest {
  final int page;
  final int pageSize;

  GetNotificationFeedRequest._({required this.page, required this.pageSize});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    data['page_size'] = pageSize;
    return data;
  }
}

class GetNotificationFeedRequestBuilder {
  int? _page;
  int? _pageSize;

  GetNotificationFeedRequestBuilder();

  GetNotificationFeedRequestBuilder page(int page) {
    _page = page;
    return this;
  }

  GetNotificationFeedRequestBuilder pageSize(int pageSize) {
    _pageSize = pageSize;
    return this;
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
