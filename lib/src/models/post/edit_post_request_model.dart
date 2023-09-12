import 'package:likeminds_feed/likeminds_feed.dart';

class EditPostRequest {
  final String postId;
  final String postText;
  final List<Attachment>? attachments;
  final List<Topic>? topics;

  EditPostRequest._({
    required this.postId,
    required this.postText,
    required this.attachments,
    this.topics,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': postText,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'topic_ids': topics?.map((e) => e.id).toList(),
    };
  }
}

class EditPostRequestBuilder {
  String? _postId;
  String? _postText;
  List<Attachment>? _attachments;
  List<Topic>? _topics;

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

  void topics(List<Topic> topics) {
    _topics = topics;
  }

  EditPostRequest build() {
    return EditPostRequest._(
      postId: _postId!,
      postText: _postText!,
      attachments: _attachments!,
      topics: _topics,
    );
  }
}
