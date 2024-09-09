class GetPersonalisedFeedRequest {
  final int page;
  final int? pageSize;
  final bool? shouldRecompute;
  final bool? shouldReorder;

  GetPersonalisedFeedRequest._({
    required this.page,
    this.pageSize,
    this.shouldRecompute,
    this.shouldReorder,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
      'should_recompute': shouldRecompute,
      'should_reorder': shouldReorder,
    };
  }
}

class GetPersonalisedFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  bool? _shouldRecompute;
  bool? _shouldReorder;

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

  GetPersonalisedFeedRequest build() {
    if (_page == null) {
      throw ArgumentError('page is required');
    }
    return GetPersonalisedFeedRequest._(
      page: _page!,
      pageSize: _pageSize,
      shouldRecompute: _shouldRecompute,
      shouldReorder: _shouldReorder,
    );
  }
}
