import 'package:likeminds_feed/likeminds_feed.dart';

class AddPostRequest {
  final String text;
  final int? feedroomId;
  final List<Attachment>? attachments;
  final List<Topic>? topics;
  final bool? isRepost;

  AddPostRequest._({
    required this.text,
    required this.attachments,
    this.feedroomId,
    this.topics,
    this.isRepost,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'feedroom_id': feedroomId,
      'topic_ids': topics?.map((e) => e.id).toList(),
      'is_repost': isRepost,
    };
  }
}

class AddPostRequestBuilder {
  String? _text;
  int? _feedroomId;
  List<Attachment>? _attachments;
  List<Topic>? _topics;
  bool _isRepost = false;

  AddPostRequestBuilder();

  void text(String text) {
    _text = text;
  }

  void feedroomId(int feedroomId) {
    _feedroomId = feedroomId;
  }

  void attachments(List<Attachment> attachments) {
    _attachments = attachments;
  }

  void topics(List<Topic> topics) {
    _topics = topics;
  }

  void isRepost(bool isRepost) {
    _isRepost = isRepost;
  }

  AddPostRequest build() {
    return AddPostRequest._(
      attachments: _attachments,
      text: _text!,
      feedroomId: _feedroomId,
      topics: _topics,
      isRepost: _isRepost,
    );
  }
}
