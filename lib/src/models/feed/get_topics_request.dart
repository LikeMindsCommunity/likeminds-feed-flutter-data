class GetTopicsRequest {
  int page;
  int pageSize;
  // required for creating post to fetch all the enabled topics
  bool? isEnabled;
  String? search;
  String? searchType;
  List<String>? parentIds;
  List<String>? orderBy;

  GetTopicsRequest._({
    required this.isEnabled,
    required this.page,
    required this.pageSize,
    this.search,
    this.searchType,
    this.parentIds,
    this.orderBy,
  });

  Map<String, dynamic> toJson() => {
        'is_enabled': isEnabled,
        'page': page,
        'page_size': pageSize,
        'search': search,
        'search_type': searchType,
        'parent_ids': parentIds,
        'order_by': orderBy,
      };
}

class GetTopicsRequestBuilder {
  int? _page;
  int? _pageSize;
  bool? _isEnabled;
  String? _search;
  String? _searchType;
  List<String>? _parentIds;
  List<String>? _orderBy;

  GetTopicsRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void isEnabled(bool? isEnabled) {
    _isEnabled = isEnabled;
  }

  void search(String search) {
    _search = search;
  }

  void searchType(String searchType) {
    _searchType = searchType;
  }

  void parentIds(List<String> parentIds) {
    _parentIds = parentIds;
  }

  void orderBy(List<String> orderBy) {
    _orderBy = orderBy;
  }

  GetTopicsRequest build() {
    return GetTopicsRequest._(
      isEnabled: _isEnabled,
      page: _page!,
      pageSize: _pageSize!,
      search: _search,
      searchType: _searchType,
      parentIds: _parentIds,
      orderBy: _orderBy,
    );
  }
}
