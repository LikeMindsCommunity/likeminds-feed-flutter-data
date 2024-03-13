class GetFeedOfFeedRoomRequest {
  final int page;
  final int pageSize;
  final int feedroomId;
  final List<String>? topicIds;

  GetFeedOfFeedRoomRequest._({
    required this.page,
    required this.pageSize,
    required this.feedroomId,
    this.topicIds,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'feedroom_id': feedroomId,
        'topic_ids': topicIds,
      };
}

class GetFeedOfFeedRoomRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _feedroomId;
  List<String>? _topicIds;

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void topicIds(List<String> topicIds) {
    _topicIds = topicIds;
  }

  GetFeedOfFeedRoomRequest build() {
    return GetFeedOfFeedRoomRequest._(
      page: _page!,
      pageSize: _pageSize!,
      feedroomId: _feedroomId!,
      topicIds: _topicIds,
    );
  }
}
