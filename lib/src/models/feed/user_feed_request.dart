class GetUserPostRequest {
  final int page;
  final int pageSize;
  final String uuid;

  GetUserPostRequest._({
    required this.page,
    required this.pageSize,
    required this.uuid,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetUserPostRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _uuid;

  GetUserPostRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  GetUserPostRequest build() {
    return GetUserPostRequest._(
      page: _page!,
      pageSize: _pageSize!,
      uuid: _uuid!,
    );
  }
}
