import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/post/attachment_model.dart';

class AddPostRequest {
  final String text;
  final int? feedroomId;
  final List<Attachment>? attachments;
  final List<Topic>? topics;

  AddPostRequest._({
    required this.text,
    required this.attachments,
    this.feedroomId,
    this.topics,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'feedroom_id': feedroomId,
      'topic_ids': topics?.map((e) => e.id).toList(),
    };
  }
}

class AddPostRequestBuilder {
  String? _text;
  int? _feedroomId;
  List<Attachment>? _attachments;
  List<Topic>? _topics;

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

  AddPostRequest build() {
    return AddPostRequest._(
      attachments: _attachments,
      text: _text!,
      feedroomId: _feedroomId,
      topics: _topics,
    );
  }
}
