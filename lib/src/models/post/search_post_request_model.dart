class SearchPostRequest {
  int? page;
  int? pageSize;
  String? search;
  String? searchType;

  SearchPostRequest._({
    required this.page,
    required this.pageSize,
    required this.search,
    required this.searchType,
  });
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
      'search': search,
      'searchType': searchType,
    };
  }
}

class SearchPostRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _search;
  String? _searchType;

  SearchPostRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void search(String search) {
    _search = search;
  }

  void searchType(String searchType) {
    _searchType = searchType;
  }

  SearchPostRequest build() {
    return SearchPostRequest._(
      page: _page,
      pageSize: _pageSize,
      search: _search,
      searchType: _searchType,
    );
  }
}
