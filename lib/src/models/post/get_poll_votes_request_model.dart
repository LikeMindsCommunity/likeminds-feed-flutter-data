class GetPollVotesRequest {
  String pollId;
  List<String> votes;

  GetPollVotesRequest._({
    required this.pollId,
    required this.votes,
  });

  Map<String, dynamic> toJson() {
    return {
      'votes': votes,
    };
  }
}

class GetPollVotesRequestBuilder {
  String? _pollId;
  List<String>? _votes;

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
    );
  }
}
