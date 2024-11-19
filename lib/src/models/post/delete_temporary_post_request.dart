class DeleteTemporaryPostRequest {
  final String temporaryPostId;

  DeleteTemporaryPostRequest._({
    required this.temporaryPostId,
  });
}

class DeleteTemporaryPostRequestBuilder {
  String? _temporaryPostId;

  DeleteTemporaryPostRequestBuilder();

  void temporaryPostId(String temporaryPostId) {
    _temporaryPostId = temporaryPostId;
  }

  DeleteTemporaryPostRequest build() {
    return DeleteTemporaryPostRequest._(
      temporaryPostId: _temporaryPostId!,
    );
  }
}
