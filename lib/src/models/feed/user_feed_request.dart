class GetUserFeedRequest {
  final int page;
  final int pageSize;
  final String uuid;

  GetUserFeedRequest._({
    required this.page,
    required this.pageSize,
    required this.uuid,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetUserFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _uuid;

  GetUserFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  GetUserFeedRequest build() {
    return GetUserFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      uuid: _uuid!,
    );
  }
}
