import 'package:likeminds_feed/likeminds_feed.dart';

class EditPostRequest {
  final String postId;
  final String postText;
  final String? heading;
  final List<Attachment>? attachments;
  final List<String>? topics;
  final bool? isRepost;

  EditPostRequest._({
    required this.postId,
    required this.postText,
    required this.attachments,
    this.topics,
    this.heading,
    this.isRepost = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': postText,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'topic_ids': topics,
      'is_repost': isRepost,
      'heading': heading,
    };
  }
}

class EditPostRequestBuilder {
  String? _postId;
  String? _postText;
  List<Attachment>? _attachments;
  List<String>? _topics;
  bool _isRepost = false;
  String? _heading;

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

  void topics(List<String> topics) {
    _topics = topics;
  }

  void isRepost(bool isRepost) {
    _isRepost = isRepost;
  }

  void heading(String heading) {
    _heading = heading;
  }

  EditPostRequest build() {
    return EditPostRequest._(
      postId: _postId!,
      postText: _postText!,
      attachments: _attachments!,
      topics: _topics,
      isRepost: _isRepost,
      heading: _heading,
    );
  }
}
