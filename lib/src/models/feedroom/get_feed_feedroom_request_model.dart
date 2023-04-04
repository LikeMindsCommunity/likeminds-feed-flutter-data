class GetFeedOfFeedRoomRequest {
  final int page;
  final int pageSize;
  final int feedroomId;

  GetFeedOfFeedRoomRequest._({
    required this.page,
    required this.pageSize,
    required this.feedroomId,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'feedroomId': feedroomId,
      };
}

class GetFeedOfFeedRoomRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _feedroomId;

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetFeedOfFeedRoomRequest build() {
    return GetFeedOfFeedRoomRequest._(
      page: _page!,
      pageSize: _pageSize!,
      feedroomId: _feedroomId!,
    );
  }
}
