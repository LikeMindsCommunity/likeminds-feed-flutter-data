class GetFeedroomRequest {
  final int page;
  final int? pageSize;
  final int? feedroomId;

  GetFeedroomRequest._({
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

class GetFeedroomRequestBuilder {
  int? _page;
  int? _feedroomId;
  int? _pageSize;

  GetFeedroomRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetFeedroomRequest build() {
    return GetFeedroomRequest._(
      page: _page!,
      feedroomId: _feedroomId,
      pageSize: _pageSize,
    );
  }
}
