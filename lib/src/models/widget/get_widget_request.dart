class GetWidgetRequest {
  int page;
  int pageSize;
  String searchKey;
  String searchValue;

  GetWidgetRequest._({
    required this.pageSize,
    required this.page,
    required this.searchKey,
    required this.searchValue,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'search_key': '"$searchKey"',
        'search_value': '"$searchValue"',
      };
}

class GetWidgetRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _searchKey;
  String? _searchValue;

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void searchKey(String searchKey) {
    _searchKey = searchKey;
  }

  void searchValue(String searchValue) {
    _searchValue = searchValue;
  }

  GetWidgetRequest build() {
    return GetWidgetRequest._(
      page: _page!,
      pageSize: _pageSize!,
      searchKey: _searchKey!,
      searchValue: _searchValue!,
    );
  }
}
