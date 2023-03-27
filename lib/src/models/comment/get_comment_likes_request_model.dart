class GetCommentLikesRequest {
  final String commentId;
  final String postId;
  final int page;
  final int pageSize;

  GetCommentLikesRequest({
    required this.commentId,
    required this.postId,
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'post_id': postId,
      'page': page,
      'page_size': pageSize
    };
  }
}
