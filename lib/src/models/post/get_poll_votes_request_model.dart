class GetPollVotesRequest {
  String pollId;
  List<String> votes;
  final int? page;
  final int? pageSize;

  GetPollVotesRequest._({
    required this.pollId,
    required this.votes,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'votes': votes,
      'page': page,
      'page_size': pageSize,
    };
  }
}

class GetPollVotesRequestBuilder {
  String? _pollId;
  List<String>? _votes;
  int? _page;
  int? _pageSize;

  GetPollVotesRequestBuilder();

  void pollId(String pollId) {
    _pollId = pollId;
  }

  void votes(List<String> votes) {
    _votes = votes;
  }

  GetPollVotesRequest build() {
    if (_pollId == null) throw Exception('pollId is required');
    if (_votes == null) throw Exception('votes is required');

    return GetPollVotesRequest._(
      pollId: _pollId!,
      votes: _votes!,
      page: _page,
      pageSize: _pageSize,
    );
  }
}
