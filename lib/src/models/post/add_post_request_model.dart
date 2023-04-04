import 'package:likeminds_feed/src/models/post/attachment_model.dart';

class AddPostRequest {
  final String text;
  final int? feedroomId;
  final List<Attachment>? attachments;

  AddPostRequest._({
    required this.text,
    required this.attachments,
    this.feedroomId,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'attachments': attachments,
      'feedroom_id': feedroomId,
    };
  }
}

class AddPostRequestBuilder {
  String? _text;
  int? _feedroomId;
  List<Attachment>? _attachments;

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

  AddPostRequest build() {
    return AddPostRequest._(
      attachments: _attachments,
      text: _text!,
      feedroomId: _feedroomId,
    );
  }
}
