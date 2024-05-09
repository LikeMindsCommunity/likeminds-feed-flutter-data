class AddPollOptionRequest {
  String pollId;
  String text;

  AddPollOptionRequest._({
    required this.pollId,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}

class AddPollOptionRequestBuilder {
  String? _pollId;
  String? _text;

  AddPollOptionRequestBuilder();

  void pollId(String pollId) {
    _pollId = pollId;
  }

  void text(String text) {
    _text = text;
  }

  AddPollOptionRequest build() {
    if (_pollId == null) throw Exception('pollId is required');
    if (_text == null) throw Exception('text is required');

    return AddPollOptionRequest._(
      pollId: _pollId!,
      text: _text!,
    );
  }
}
