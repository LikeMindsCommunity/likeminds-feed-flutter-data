class PinPostRequest {
  final String postId;

  PinPostRequest({
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
      };
}

class PinPostRequestBuilder {
  String? _postId;

  PinPostRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  PinPostRequest build() {
    return PinPostRequest._(
      postId: _postId!,
    );
  }
}
