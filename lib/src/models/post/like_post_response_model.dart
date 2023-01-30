import 'package:json_annotation/json_annotation.dart';

part 'like_post_response_model.g.dart';

class LikePostResponse {
  final bool success;
  final String? errorMessage;
  final int? likes;

  LikePostResponse({
    required this.success,
    required this.errorMessage,
    required this.likes,
  });

  factory LikePostResponse.fromEntity(LikePostResponseEntity entity) {
    return LikePostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      likes: entity.likes,
    );
  }

  LikePostResponseEntity toEntity() {
    return LikePostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      likes: likes,
    );
  }
}

@JsonSerializable()
class LikePostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  int? likes;

  LikePostResponseEntity({
    required this.success,
    required this.errorMessage,
    this.likes,
  });

  set setLikes(int? likes) {
    this.likes = likes;
  }

  factory LikePostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LikePostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LikePostResponseEntityToJson(this);
}
