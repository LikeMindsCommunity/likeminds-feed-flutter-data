class GetFeedRequest {
  final int page;
  final int pageSize;
  final List<String>? topics;
  final List<String>? widgetIds;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
    this.topics,
    this.widgetIds,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'topic_ids': topics,
        'widget_ids': widgetIds?.toString(),
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  List<String>? _topics;
  List<String>? _widgetIds;

  GetFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void topics(List<String> topics) {
    _topics = topics;
  }

  void widgetIds(List<String> widgetIds) {
    _widgetIds = widgetIds;
  }

  GetFeedRequest build() {
    return GetFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      topics: _topics,
      widgetIds: _widgetIds,
    );
  }
}
