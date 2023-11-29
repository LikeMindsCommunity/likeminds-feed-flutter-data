class ClearLogRequest {
  int timestamp;

  ClearLogRequest._({required this.timestamp});
}

class ClearLogRequestBuilder {
  int? _timestamp;

  void timestamp(int timestamp) {
    _timestamp = timestamp;
  }

  ClearLogRequest build() {
    return ClearLogRequest._(
      timestamp: _timestamp!,
    );
  }
}
