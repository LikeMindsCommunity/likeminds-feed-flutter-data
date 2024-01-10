class GetUserActivityRequest {
  final String uuid;
  final int page;
  final int pageSize;

  GetUserActivityRequest._({
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

class GetUserActivityRequestBuilder {
  String? _uuid;
  int? _page;
  int? _pageSize;

  GetUserActivityRequestBuilder();

  void uuid(String uuid) {
    _uuid = uuid;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetUserActivityRequest build() {
    if (_uuid == null) {
      throw Exception('UUID can\'t be null');
    }
    if (_page == null) {
      throw Exception('Page can\'t be null');
    }
    if (_pageSize == null) {
      throw Exception('Page size can\'t be null');
    }
    return GetUserActivityRequest._(
      uuid: _uuid!,
      page: _page!,
      pageSize: _pageSize!,
    );
  }
}
