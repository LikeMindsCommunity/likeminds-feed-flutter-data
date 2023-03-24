class GetCommentLikesRequest {
  final String commentId;
  final String postId;

  GetCommentLikesRequest({required this.commentId, required this.postId});

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'post_id': postId,
    };
  }
}
