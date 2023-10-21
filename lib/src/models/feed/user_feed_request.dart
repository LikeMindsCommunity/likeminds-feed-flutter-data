class GetUserFeedRequest {
  final int page;
  final int pageSize;
  final String userId;

  GetUserFeedRequest._({
    required this.page,
    required this.pageSize,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetUserFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  String? _userId;

  GetUserFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void userId(String userId) {
    _userId = userId;
  }

  GetUserFeedRequest build() {
    return GetUserFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      userId: _userId!,
    );
  }
}
