import 'package:json_annotation/json_annotation.dart';

part 'like_post_response_model.g.dart';

class LikePostResponse {
  final bool success;
  final String? errorMessage;

  LikePostResponse({required this.success, required this.errorMessage});

  factory LikePostResponse.fromEntity(LikePostResponseEntity entity) {
    return LikePostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  LikePostResponseEntity toEntity() {
    return LikePostResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class LikePostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  LikePostResponseEntity({required this.success, required this.errorMessage});

  factory LikePostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LikePostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LikePostResponseEntityToJson(this);
}
