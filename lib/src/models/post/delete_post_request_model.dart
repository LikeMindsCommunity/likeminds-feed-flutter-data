class DeletePostRequest {
  final String postId;
  final String deleteReason;
  final bool isRepost;

  DeletePostRequest._({
    required this.postId,
    required this.deleteReason,
    required this.isRepost,
  });

  Map<String, dynamic> toJson() {
    return {
      'delete_reason': deleteReason,
      'is_repost': isRepost,
    };
  }
}

class DeletePostRequestBuilder {
  String? _postId;
  String? _deleteReason;
  bool _isRepost = false;

  void postId(String postId) {
    _postId = postId;
  }

  void deleteReason(String deleteReason) {
    _deleteReason = deleteReason;
  }

  void isRepost(bool isRepost) {
    _isRepost = isRepost;
  }

  DeletePostRequest build() {
    return DeletePostRequest._(
      postId: _postId!,
      deleteReason: _deleteReason!,
      isRepost: _isRepost,
    );
  }
}
