import 'package:json_annotation/json_annotation.dart';

part 'branding_request_model.g.dart';

class BrandingRequest {
  final String communityId;
  final String? userId;

  BrandingRequest({
    required this.communityId,
    this.userId,
  });

  factory BrandingRequest.fromEntity(BrandingRequestEntity entity) {
    return BrandingRequest(
      communityId: entity.communityId,
      userId: entity.userId,
    );
  }

  BrandingRequestEntity toEntity() {
    return BrandingRequestEntity(
      communityId: communityId,
      userId: userId,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BrandingRequestEntity {
  @JsonKey(name: 'community_id')
  final String communityId;

  @JsonKey(name: 'user_id')
  final String? userId;

  BrandingRequestEntity({
    required this.communityId,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$BrandingRequestEntityToJson(this);

  factory BrandingRequestEntity.fromJson(Map<String, dynamic> data) =>
      _$BrandingRequestEntityFromJson(data);
}
