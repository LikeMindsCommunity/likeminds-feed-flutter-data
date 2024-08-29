class PostSeenRequest {
  final List<String> seenPostIDs;

  PostSeenRequest({required this.seenPostIDs});

  Map<String, dynamic> toJson() {
    return {
      'post_ids': seenPostIDs,
    };
  }
}

class PostSeenRequestBuilder {
  List<String> _seenPostIDs = [];

  PostSeenRequestBuilder();

  void seenPostIDs(List<String> seenPostIDs) {
    _seenPostIDs = seenPostIDs;
  }

  PostSeenRequest build() {
    return PostSeenRequest(
      seenPostIDs: _seenPostIDs,
    );
  }
}
