import 'dart:convert';

class GetFeedRequest {
  final int page;
  final int pageSize;
  final List<String>? topicIds;
  final List<String>? widgetIds;
  final List<String>? startFeedWithPostIds;
  final LMFeedThemeType? feedType;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
    this.topicIds,
    this.widgetIds,
    this.startFeedWithPostIds,
    this.feedType,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'topic_ids': topicIds?.join(','),
        'widget_ids': widgetIds?.join(','),
        'post_ids': jsonEncode(startFeedWithPostIds),
        'feed_type': feedType?.value,
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  List<String>? _topicIds;
  List<String>? _widgetIds;
  List<String>? _startFeedWithPostIds;
  LMFeedThemeType? _feedType;

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

  void feedType(LMFeedThemeType? feedType) {
    _feedType = feedType;
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
      feedType: _feedType,
    );
  }
}

enum LMFeedThemeType {
  socialFeed('social_feed'),
  qnaFeed('qna_feed'),
  videoFeed('video_feed');

  final String value;
  const LMFeedThemeType(this.value);

  factory LMFeedThemeType.fromString(String? value) {
    switch (value) {
      case 'social_feed':
        return socialFeed;
      case 'qna_feed':
        return qnaFeed;
      case 'video_feed':
        return videoFeed;
      default:
        throw ArgumentError('Unknown LMFeedTheme value: $value');
    }
  }
}
