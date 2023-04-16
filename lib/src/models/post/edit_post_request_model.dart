import 'package:likeminds_feed/likeminds_feed.dart';

class EditPostRequest {
  final String postId;
  final String postText;
  final List<Attachment>? attachments;

  EditPostRequest._({
    required this.postId,
    required this.postText,
    required this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': postText,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
    };
  }
}

class EditPostRequestBuilder {
  String? _postId;
  String? _postText;
  List<Attachment>? _attachments;

  EditPostRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void postText(String postText) {
    _postText = postText;
  }

  void attachments(List<Attachment> attachments) {
    _attachments = attachments;
  }

  EditPostRequest build() {
    return EditPostRequest._(
      postId: _postId!,
      postText: _postText!,
      attachments: _attachments!,
    );
  }
}
