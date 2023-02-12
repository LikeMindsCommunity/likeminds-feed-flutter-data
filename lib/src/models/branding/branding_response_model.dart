import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branding_response_model.g.dart';

class BrandingResponse {
  final bool success;
  final String? errorMessage;
  final Branding? branding;

  BrandingResponse({
    required this.success,
    this.errorMessage,
    this.branding,
  });

  factory BrandingResponse.fromEntity(BrandingResponseEntity entity) {
    return BrandingResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      branding: entity.branding != null
          ? Branding.fromEntity(entity.branding!)
          : null,
    );
  }

  BrandingResponseEntity toEntity() {
    return BrandingResponseEntity(
      success: success,
      errorMessage: errorMessage,
      branding: branding?.toEntity(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class BrandingResponseEntity {
  final bool success;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  final BrandingEntity? branding;

  BrandingResponseEntity({
    required this.success,
    this.errorMessage,
    this.branding,
  });

  factory BrandingResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$BrandingResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$BrandingResponseEntityToJson(this);
}
