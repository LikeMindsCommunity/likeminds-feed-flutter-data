import 'package:json_annotation/json_annotation.dart';

part 'add_post_response_model.g.dart';

class AddPostResponse {
  final bool success;
  final String? errorMessage;

  AddPostResponse({
    required this.success,
    required this.errorMessage,
  });

  factory AddPostResponse.fromEntity({required AddPostResponseEntity entity}) {
    return AddPostResponse(
        success: entity.success, errorMessage: entity.errorMessage);
  }
}

@JsonSerializable()
class AddPostResponseEntity {
  final bool success;

  @JsonKey(name: 'error_message')
  final String errorMessage;

  AddPostResponseEntity({
    required this.success,
    required this.errorMessage,
  });

  factory AddPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostResponseEntityToJson(this);
}
