class FollowFeedRoomRequest {
  final int feedRoomId;
  final bool value;

  FollowFeedRoomRequest._({
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

class FollowFeedRoomRequestBuilder {
  int? _feedRoomId;
  bool? _value;

  FollowFeedRoomRequestBuilder();

  void feedRoomId(int feedRoomId) {
    _feedRoomId = feedRoomId;
  }

  void value(bool value) {
    _value = value;
  }

  FollowFeedRoomRequest build() {
    if (_feedRoomId == null) {
      throw Exception('feedRoomId is required');
    }
    if (_value == null) {
      throw Exception('value is required');
    }
    return FollowFeedRoomRequest._(
      feedRoomId: _feedRoomId!,
      value: _value!,
    );
  }
}
