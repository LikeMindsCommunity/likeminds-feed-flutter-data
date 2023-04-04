class EditPostRequest {
  final String postId;
  final String postText;

  EditPostRequest({
    required this.postId,
    required this.postText,
  });

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'post_text': postText,
    };
  }
}
