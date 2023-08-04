class GetTopicsRequest {
  int page;
  int pageSize;
  // required for creating post to fetch all the enabled topics
  bool? isEnabled;
  String? search;
  String? searchType;

  GetTopicsRequest._(
      {required this.isEnabled,
      required this.page,
      required this.pageSize,
      this.search,
      this.searchType});

  Map<String, dynamic> toJson() => {
        'is_enabled': isEnabled,
        'page': page,
        'search': search,
        'search_type': searchType,
      };
}

class GetTopicsRequestBuilder {
  int? _page;
  int? _pageSize;
  bool? _isEnabled;
  String? _search;
  String? _searchType;

  GetTopicsRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void isEnabled(bool isEnabled) {
    _isEnabled = isEnabled;
  }

  void search(String search) {
    _search = search;
  }

  void searchType(String searchType) {
    _searchType = searchType;
  }

  GetTopicsRequest build() {
    return GetTopicsRequest._(
      isEnabled: _isEnabled,
      page: _page!,
      pageSize: _pageSize!,
      search: _search,
      searchType: _searchType,
    );
  }
}
