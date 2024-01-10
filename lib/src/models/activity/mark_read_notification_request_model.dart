class MarkReadNotificationRequest {
  final String activityId;

  MarkReadNotificationRequest._({required this.activityId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['activity_id'] = activityId;
    return data;
  }
}

class MarkReadNotificationRequestBuilder {
  String? _activityId;

  MarkReadNotificationRequestBuilder();

  MarkReadNotificationRequestBuilder activityId(String activityId) {
    _activityId = activityId;
    return this;
  }

  MarkReadNotificationRequest build() {
    if (_activityId == null) {
      throw Exception('Activity id can\'t be null');
    }
    return MarkReadNotificationRequest._(
      activityId: _activityId!,
    );
  }
}
