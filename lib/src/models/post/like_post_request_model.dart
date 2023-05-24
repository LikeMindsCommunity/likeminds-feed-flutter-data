class LikePostRequest {
  final String postId;

  LikePostRequest._({
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
      };

  String get getPostId => postId;
}

class LikePostRequestBuilder {
  String? _postId;

  void postId(String postId) {
    _postId = postId;
  }

  LikePostRequest build() {
    return LikePostRequest._(
      postId: _postId!,
    );
  }
}
