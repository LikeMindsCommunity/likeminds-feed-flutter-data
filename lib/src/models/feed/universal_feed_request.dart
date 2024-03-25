class GetFeedRequest {
  final int page;
  final int pageSize;
  final List<String>? topicIds;
  final List<String>? widgetIds;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
    this.topicIds,
    this.widgetIds,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'topic_ids': topicIds?.join(','),
        'widget_ids': widgetIds?.join(','),
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  List<String>? _topicIds;
  List<String>? _widgetIds;

  GetFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void topicIds(List<String> topicIds) {
    _topicIds = topicIds;
  }

  void widgetIds(List<String> widgetIds) {
    _widgetIds = widgetIds;
  }

  GetFeedRequest build() {
    return GetFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      topicIds: _topicIds,
      widgetIds: _widgetIds,
    );
  }
}
