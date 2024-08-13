class GetFeedRoomRequest {
  final int page;
  final int? pageSize;
  final int? feedroomId;

  GetFeedRoomRequest._({
    required this.page,
    this.feedroomId,
    this.pageSize,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'feedroom_id': feedroomId,
        'page_size': pageSize,
      };
}

class GetFeedRoomRequestBuilder {
  int? _page;
  int? _feedroomId;
  int? _pageSize;

  GetFeedRoomRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetFeedRoomRequest build() {
    return GetFeedRoomRequest._(
      page: _page!,
      feedroomId: _feedroomId,
      pageSize: _pageSize,
    );
  }
}
