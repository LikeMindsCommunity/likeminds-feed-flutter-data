class UpdateUserTopicsRequest {
  Map<String, bool> topicsId;

  String uuid;

  UpdateUserTopicsRequest._({
    required this.topicsId,
    required this.uuid,
  });

  Map<String, dynamic> toJson() => {
        'topic_ids': topicsId,
        'uuid': uuid,
      };
}

class UpdateUserTopicsRequestBuilder {
  Map<String, bool> _topicsId = {};
  String? _uuid;

  UpdateUserTopicsRequestBuilder();

  void topicsId(Map<String, bool> topicsId) {
    _topicsId = topicsId;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  UpdateUserTopicsRequest build() {
    return UpdateUserTopicsRequest._(
      topicsId: _topicsId,
      uuid: _uuid!,
    );
  }
}
