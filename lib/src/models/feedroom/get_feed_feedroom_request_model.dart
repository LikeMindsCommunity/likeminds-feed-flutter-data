import 'package:likeminds_feed/likeminds_feed.dart';

class GetFeedOfFeedRoomRequest {
  final int page;
  final int pageSize;
  final int feedroomId;
  final List<Topic>? topics;

  GetFeedOfFeedRoomRequest._({
    required this.page,
    required this.pageSize,
    required this.feedroomId,
    this.topics,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'feedroom_id': feedroomId,
        'topic_ids': topics?.map((e) => e.id).toList().toString(),
      };
}

class GetFeedOfFeedRoomRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _feedroomId;
  List<Topic>? _topics;

  void page(int page) {
    _page = page;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void topics(List<Topic> topics) {
    _topics = topics;
  }

  GetFeedOfFeedRoomRequest build() {
    return GetFeedOfFeedRoomRequest._(
      page: _page!,
      pageSize: _pageSize!,
      feedroomId: _feedroomId!,
      topics: _topics,
    );
  }
}
