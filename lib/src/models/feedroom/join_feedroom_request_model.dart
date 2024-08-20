class JoinFeedRoomRequest {
  final int feedRoomId;
  final bool value;

  JoinFeedRoomRequest._({
    required this.feedRoomId,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'feedroom_id': feedRoomId,
      'value': value,
    };
  }
}

class JoinFeedRoomRequestBuilder {
  int? _feedRoomId;
  bool? _value;

  JoinFeedRoomRequestBuilder();

  void feedRoomId(int feedRoomId) {
    _feedRoomId = feedRoomId;
  }

  void value(bool value) {
    _value = value;
  }

  JoinFeedRoomRequest build() {
    if (_feedRoomId == null) {
      throw Exception('feedRoomId is required');
    }
    if (_value == null) {
      throw Exception('value is required');
    }
    return JoinFeedRoomRequest._(
      feedRoomId: _feedRoomId!,
      value: _value!,
    );
  }
}
