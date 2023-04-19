class TagRequestModel {
  final int? feedroomId;
  final int? page;
  final int? pageSize;
  final String? searchQuery;

  TagRequestModel._({
    this.feedroomId,
    this.page,
    this.pageSize,
    this.searchQuery,
  });

  Map<String, dynamic> toJson() {
    return {
      'feedroom_id': feedroomId,
      'page': page,
      'page_size': pageSize,
      'search_query': searchQuery,
    };
  }
}

class TagRequestModelBuilder {
  int? _feedroomId;
  int? _page;
  int? _pageSize;
  String? _searchQuery;

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void searchQuery(String searchQuery) {
    _searchQuery = searchQuery;
  }

  TagRequestModel build() {
    return TagRequestModel._(
      feedroomId: _feedroomId,
      page: _page,
      pageSize: _pageSize,
      searchQuery: _searchQuery,
    );
  }
}
