import 'package:json_annotation/json_annotation.dart';
import 'og_tags_model.dart';

part 'decode_url_response_model.g.dart';

class DecodeUrlResponse {
  final bool success;
  final String? errorMessage;
  final OgTags? ogTags;

  DecodeUrlResponse({
    required this.success,
    this.errorMessage,
    this.ogTags,
  });

  factory DecodeUrlResponse.fromEntity(DecodeUrlResponseEntity entity) {
    return DecodeUrlResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      ogTags: entity.ogTags != null ? OgTags.fromEntity(entity.ogTags!) : null,
    );
  }

  DecodeUrlResponseEntity toEntity() {
    return DecodeUrlResponseEntity(
      success: success,
      errorMessage: errorMessage,
      ogTags: ogTags?.toEntity(),
    );
  }
}

@JsonSerializable()
class DecodeUrlResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'og_tags')
  final OgTagsEntity? ogTags;

  DecodeUrlResponseEntity({
    required this.success,
    this.errorMessage,
    this.ogTags,
  });

  factory DecodeUrlResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DecodeUrlResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DecodeUrlResponseEntityToJson(this);
}
