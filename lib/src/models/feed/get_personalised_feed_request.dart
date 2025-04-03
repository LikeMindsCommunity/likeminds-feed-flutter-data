import 'dart:convert';

class GetPersonalisedFeedRequest {
  final int page;
  final int? pageSize;
  final bool? shouldRecompute;
  final bool? shouldReorder;
  final List<String>? startFeedWithPostIds;

  GetPersonalisedFeedRequest._({
    required this.page,
    this.pageSize,
    this.shouldRecompute,
    this.shouldReorder,
    this.startFeedWithPostIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
      'should_recompute': shouldRecompute,
      'should_reorder': shouldReorder,
      'post_ids': jsonEncode(startFeedWithPostIds),
    };
  }
}

class GetPersonalisedFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  bool? _shouldRecompute;
  bool? _shouldReorder;
  List<String>? _startFeedWithPostIds;

  GetPersonalisedFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void shouldRecompute(bool shouldRecompute) {
    _shouldRecompute = shouldRecompute;
  }

  void shouldReorder(bool shouldReorder) {
    _shouldReorder = shouldReorder;
  }

  void startFeedWithPostIds(List<String> startFeedWithPostIds) {
    _startFeedWithPostIds = startFeedWithPostIds;
  }

  GetPersonalisedFeedRequest build() {
    if (_page == null) {
      throw ArgumentError('page is required');
    }
    return GetPersonalisedFeedRequest._(
      page: _page!,
      pageSize: _pageSize,
      shouldRecompute: _shouldRecompute,
      shouldReorder: _shouldReorder,
      startFeedWithPostIds: _startFeedWithPostIds,
    );
  }
}
