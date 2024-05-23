import 'package:likeminds_feed/likeminds_feed.dart';

class EditPendingPostRequest {
  final String postId;
  final String postText;
  final String? heading;
  final List<Attachment>? attachments;
  final List<String>? topicIds;
  final bool? isRepost;

  EditPendingPostRequest._({
    required this.postId,
    required this.postText,
    required this.attachments,
    this.topicIds,
    this.heading,
    this.isRepost = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': postText,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'topic_ids': topicIds,
      'is_repost': isRepost,
      'heading': heading,
    };
  }
}

class EditPendingPostRequestBuilder {
  String? _postId;
  String? _postText;
  List<Attachment>? _attachments;
  List<String>? _topicIds;
  bool _isRepost = false;
  String? _heading;

  EditPendingPostRequestBuilder();

  void postId(String postId) {
    _postId = postId;
  }

  void postText(String postText) {
    _postText = postText;
  }

  void attachments(List<Attachment> attachments) {
    _attachments = attachments;
  }

  void topicIds(List<String> topicIds) {
    _topicIds = topicIds;
  }

  void isRepost(bool isRepost) {
    _isRepost = isRepost;
  }

  void heading(String heading) {
    _heading = heading;
  }

  EditPendingPostRequest build() {
    assert(_postId != null, 'postId must not be null');
    assert(_postText != null, 'postText must not be null');
    assert(_attachments != null, 'attachments must not be null');

    return EditPendingPostRequest._(
      postId: _postId!,
      postText: _postText!,
      attachments: _attachments!,
      topicIds: _topicIds,
      isRepost: _isRepost,
      heading: _heading,
    );
  }
}
