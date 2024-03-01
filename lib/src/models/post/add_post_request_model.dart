import 'package:likeminds_feed/likeminds_feed.dart';

class AddPostRequest {
  final String text;
  final int? feedroomId;
  final List<Attachment>? attachments;
  final List<String>? topics;
  final bool? isRepost;
  final String? heading;
  final String? tempId;

  AddPostRequest._({
    required this.text,
    required this.attachments,
    this.feedroomId,
    this.topics,
    this.heading,
    this.isRepost,
    this.tempId,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'feedroom_id': feedroomId,
      'topic_ids': topics,
      'is_repost': isRepost,
      'heading': heading,
      'temp_id': tempId,
    };
  }
}

class AddPostRequestBuilder {
  String? _text;
  int? _feedroomId;
  List<Attachment>? _attachments;
  List<String>? _topics;
  bool _isRepost = false;
  String? _heading;
  String? _tempId;

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

  void topics(List<String> topics) {
    _topics = topics;
  }

  void isRepost(bool isRepost) {
    _isRepost = isRepost;
  }

  void heading(String heading) {
    _heading = heading;
  }

  void tempId(String tempId) {
    _tempId = tempId;
  }

  AddPostRequest build() {
    return AddPostRequest._(
      attachments: _attachments,
      text: _text!,
      feedroomId: _feedroomId,
      topics: _topics,
      isRepost: _isRepost,
      heading: _heading,
      tempId: _tempId,
    );
  }
}
