import 'package:likeminds_feed/likeminds_feed.dart';

class GetFeedRequest {
  final int page;
  final int pageSize;
  final List<Topic>? topics;

  GetFeedRequest._({
    required this.page,
    required this.pageSize,
    this.topics,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'topic_ids': topics?.map((e) => e.id).toList(),
      };
}

class GetFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  List<Topic>? _topics;

  GetFeedRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void topics(List<Topic> topics) {
    _topics = topics;
  }

  GetFeedRequest build() {
    return GetFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      topics: _topics,
    );
  }
}
