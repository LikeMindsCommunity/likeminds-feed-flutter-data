class DeletePostRequest {
  final String postId;
  final String deleteReason;

  DeletePostRequest._({
    required this.postId,
    required this.deleteReason,
  });

  Map<String, dynamic> toJson() {
    return {
      'post_id': postId,
      'delete_reason': deleteReason,
    };
  }
}

class DeletePostRequestBuilder {
  String? _postId;
  String? _deleteReason;

  void postId(String postId) {
    _postId = postId;
  }

  void deleteReason(String deleteReason) {
    _deleteReason = deleteReason;
  }

  DeletePostRequest build() {
    return DeletePostRequest._(
      postId: _postId!,
      deleteReason: _deleteReason!,
    );
  }
}
