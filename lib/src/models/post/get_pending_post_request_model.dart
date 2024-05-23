class GetPendingPostRequest {
  final String postId;

  GetPendingPostRequest._({
    required this.postId,
  });
}

class GetPendingPostRequestBuilder {
  String? _postId;

  void postId(String postId) {
    _postId = postId;
  }

  GetPendingPostRequest build() {
    assert(_postId != null, 'postId must be set before calling build()');

    return GetPendingPostRequest._(
      postId: _postId!,
    );
  }
}
