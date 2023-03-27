class PinPostRequest {
  final String postId;

  PinPostRequest({
    required this.postId,
  });

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
    };
  }
}
