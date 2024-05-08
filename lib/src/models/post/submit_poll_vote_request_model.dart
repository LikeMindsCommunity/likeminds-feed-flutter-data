class SubmitPollVoteRequest {
  final String pollId;
  final List<String> votes;

  SubmitPollVoteRequest._({
    required this.pollId,
    required this.votes,
  });
  Map<String, dynamic> toJson() {
    return {
      'votes': votes,
    };
  }
}

class SubmitPollVoteRequestBuilder {
  String? _pollId;
  List<String>? _votes;

  SubmitPollVoteRequestBuilder();

  void pollId(String pollId) {
    _pollId = pollId;
  }

  void votes(List<String> votes) {
    _votes = votes;
  }

  SubmitPollVoteRequest build() {
    if (_pollId == null) throw Exception('pollId is required');
    if (_votes == null) throw Exception('votes is required');

    return SubmitPollVoteRequest._(
      pollId: _pollId!,
      votes: _votes!,
    );
  }
}
