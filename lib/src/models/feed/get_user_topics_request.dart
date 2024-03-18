class GetUserTopicsRequest {
  List<String> uuids;

  GetUserTopicsRequest._({
    required this.uuids,
  });

  Map<String, dynamic> toJson() => {
        'uuids': "[${uuids.map((e) => '"$e"').join(',')}]",
      };
}

class GetUserTopicsRequestBuilder {
  List<String> _uuids = [];

  GetUserTopicsRequestBuilder();

  void uuids(List<String> uuids) {
    _uuids = uuids;
  }

  GetUserTopicsRequest build() {
    return GetUserTopicsRequest._(
      uuids: _uuids,
    );
  }
}
