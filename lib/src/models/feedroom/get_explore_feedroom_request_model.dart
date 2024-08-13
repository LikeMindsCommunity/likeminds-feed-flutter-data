class GetExploreFeedRoomRequest {
  final int page;
  final int orderType;
  final int type;

  GetExploreFeedRoomRequest._({
    required this.page,
    required this.orderType,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'order_type': orderType,
        'type': type,
      };
}

class GetExploreFeedRoomRequestBuilder {
  int? _page;
  int? _orderType;
  int? _type;

  GetExploreFeedRoomRequestBuilder();

  void page(int page) {
    _page = page;
  }

  void orderType(int orderType) {
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
