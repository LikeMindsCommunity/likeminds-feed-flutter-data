class BrandingRequest {
  final String communityId;
  final String? userId;

  BrandingRequest._({
    required this.communityId,
    this.userId,
  });

  Map<String, dynamic> toJson() => {
        'community_id': communityId,
        'user_id': userId,
      };
}

class BrandingRequestBuilder {
  String? _communityId;
  String? _userId;

  BrandingRequestBuilder();

  void communityId(String communityId) {
    _communityId = communityId;
  }

  void userId(String userId) {
    _userId = userId;
  }

  BrandingRequest build() {
    return BrandingRequest._(
      communityId: _communityId!,
      userId: _userId!,
    );
  }
}
