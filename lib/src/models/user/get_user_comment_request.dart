class GetUserCommentsRequest {
  final String uuid;
  final int page;
  final int pageSize;

  GetUserCommentsRequest({
    required this.uuid,
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
    };
  }
}

class GetUserCommentsRequestBuilder {
  String? _uuid;
  int? _page;
  int? _pageSize;

  GetUserCommentsRequestBuilder();

  void uuid(String uuid) {
    _uuid = uuid;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetUserCommentsRequest build() {
    if (_uuid == null) throw Exception("uuid is required");
    if (_page == null) throw Exception("page is required");
    if (_pageSize == null) throw Exception("pageSize is required");

    return GetUserCommentsRequest(
      uuid: _uuid!,
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
