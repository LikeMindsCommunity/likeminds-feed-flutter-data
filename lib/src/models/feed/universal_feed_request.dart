import 'dart:convert';

class GetFeedRequest {
  final int page;
  final int pageSize;
  final List<String>? topicIds;
  final List<String>? widgetIds;
  final List<String>? startFeedWithPostIds;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
    this.topicIds,
    this.widgetIds,
    this.startFeedWithPostIds,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'topic_ids': topicIds?.join(','),
        'widget_ids': widgetIds?.join(','),
        'post_ids': jsonEncode(startFeedWithPostIds),
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  List<String>? _topicIds;
  List<String>? _widgetIds;
  List<String>? _startFeedWithPostIds;

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

  void startFeedWithPostIds(List<String> startFeedWithPostIds) {
    _startFeedWithPostIds = startFeedWithPostIds;
  }

  void validate() {
    if (_page == null) {
      throw ArgumentError('page is required');
    }
    if (_pageSize == null) {
      throw ArgumentError('pageSize is required');
    }
  }

  GetFeedRequest build() {
    validate();
    return GetFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      topicIds: _topicIds,
      widgetIds: _widgetIds,
      startFeedWithPostIds: _startFeedWithPostIds,
    );
  }
}
