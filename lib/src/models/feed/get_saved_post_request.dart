class GetSavedPostRequest {
  final String uuid;
  final int page;
  final int pageSize;

  GetSavedPostRequest._({
    required this.uuid,
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetSavedPostRequestBuilder {
  String? _uuid;
  int? _page;
  int? _pageSize;

  GetSavedPostRequestBuilder();

  void uuid(String uuid) {
    _uuid = uuid;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetSavedPostRequest build() {
    if (_uuid == null) throw Exception("uuid is required");
    if (_page == null) throw Exception("page is required");
    if (_pageSize == null) throw Exception("pageSize is required");

    return GetSavedPostRequest._(
      uuid: _uuid!,
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
