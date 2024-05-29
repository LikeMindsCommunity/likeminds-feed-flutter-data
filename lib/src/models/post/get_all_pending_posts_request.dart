class GetAllPendingPostsRequest {
  int page;
  int pageSize;
  String uuid;

  GetAllPendingPostsRequest._({
    required this.page,
    required this.pageSize,
    required this.uuid,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'page_size': pageSize,
      'uuid': uuid,
    };
  }
}

class GetAllPendingPostsRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _uuid;

  GetAllPendingPostsRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  GetAllPendingPostsRequest build() {
    assert(_page != null, 'Page must be set before building the request.');
    assert(_pageSize != null,
        'Page size must be set before building the request.');
    assert(_uuid != null, 'UUID must be set before building the request.');

    return GetAllPendingPostsRequest._(
      page: _page!,
      pageSize: _pageSize!,
      uuid: _uuid!,
    );
  }
}
