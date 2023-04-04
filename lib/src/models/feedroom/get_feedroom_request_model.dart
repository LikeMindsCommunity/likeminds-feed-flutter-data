class GetFeedRoomRequest {
  final int page;
  final int? feedroomId;

  GetFeedRoomRequest._({
    required this.page,
    this.feedroomId,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'feedroomId': feedroomId,
      };
}

class GetFeedRoomRequestBuilder {
  int? _page;
  int? _feedroomId;

  GetFeedRoomRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  GetFeedRoomRequest build() {
    return GetFeedRoomRequest._(
      page: _page!,
      feedroomId: _feedroomId!,
    );
  }
}
