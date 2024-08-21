class GetExploreFeedRoomRequest {
  final int page;
  final LMFeedRoomOrderType orderType;
  final int type;

  GetExploreFeedRoomRequest._({
    required this.page,
    required this.orderType,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'order_type': orderType.value,
        'type': type,
      };
}

class GetExploreFeedRoomRequestBuilder {
  int? _page;
  LMFeedRoomOrderType? _orderType;
  int? _type;

  GetExploreFeedRoomRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void orderType(LMFeedRoomOrderType orderType) {
    _orderType = orderType;
  }

  void type(int type) {
    _type = type;
  }

  GetExploreFeedRoomRequest build() {
    return GetExploreFeedRoomRequest._(
      page: _page!,
      orderType: _orderType!,
      type: _type ?? 1,
    );
  }
}

// Type of order i.e. newest=0, recently active=1, most messages=2, most participants=3
// create an advanced enum for this with the int values
enum LMFeedRoomOrderType {
  newest(0),
  recentlyActive(1),
  mostMessages(2),
  mostParticipants(3);

  final int value;

  const LMFeedRoomOrderType(this.value);

  factory LMFeedRoomOrderType.fromValue(int value) {
    switch (value) {
      case 0:
        return LMFeedRoomOrderType.newest;
      case 1:
        return LMFeedRoomOrderType.recentlyActive;
      case 2:
        return LMFeedRoomOrderType.mostMessages;
      case 3:
        return LMFeedRoomOrderType.mostParticipants;
      default:
        throw ArgumentError('Invalid OrderType value');
    }
  }
}