class PostReportRequest {
  final int tagId;
  final String? reason;
  final String entityId;
  final String entityCreatorId;
  final int entityType;

  PostReportRequest._({
    required this.tagId,
    this.reason,
    required this.entityId,
    required this.entityCreatorId,
    required this.entityType,
  });

  Map<String, dynamic> toJson() {
    return {
      'tag_id': tagId,
      'reason': reason,
      'entity_id': entityId,
      'entity_creator_id': entityCreatorId,
      'entity_type': entityType,
    };
  }
}

class PostReportRequestBuilder {
  int? _tagId;
  String? _reason;
  String? _entityId;
  String? _entityCreatorId;
  int? _entityType;

  PostReportRequestBuilder();

  void tagId(int tagId) {
    _tagId = tagId;
  }

  void reason(String reason) {
    _reason = reason;
  }

  void entityId(String entityId) {
    _entityId = entityId;
  }

  void entityCreatorId(String entityCreatorId) {
    _entityCreatorId = entityCreatorId;
  }

  void entityType(int entityType) {
    _entityType = entityType;
  }

  PostReportRequest build() {
    return PostReportRequest._(
        tagId: _tagId!,
        reason: _reason!,
        entityId: _entityId!,
        entityCreatorId: _entityCreatorId!,
        entityType: _entityType!);
  }
}
