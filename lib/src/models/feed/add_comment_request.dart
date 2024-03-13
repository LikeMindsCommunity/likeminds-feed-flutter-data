class AddCommentRequest {
  final String text;
  final String postId;
  final String? tempId;

  AddCommentRequest._({
    required this.text,
    required this.postId,
    this.tempId,
  });

  Map<String, dynamic> toJson() => {
        'post_id': postId,
        'text': text,
        'temp_id': tempId,
      };
}

class AddCommentRequestBuilder {
  String? _text;
  String? _postId;
  String? _tempId;

  AddCommentRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void postId(String postId) {
    _postId = postId;
  }

  void tempId(String tempId) {
    _tempId = tempId;
  }

  AddCommentRequest build() {
    return AddCommentRequest._(
      text: _text!,
      postId: _postId!,
      tempId: _tempId,
    );
  }
}
