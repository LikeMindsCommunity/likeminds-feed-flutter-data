class SavePostRequest {
  final String postId;

  SavePostRequest._({
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
      };
}

class SavePostRequestBuilder {
  String? _postId;

  SavePostRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  SavePostRequest build() {
    return SavePostRequest._(
      postId: _postId!,
    );
  }
}
