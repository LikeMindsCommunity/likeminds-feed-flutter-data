import 'package:json_annotation/json_annotation.dart';

part 'update_user_topics_response.g.dart';

class UpdateUserTopicsResponse {
  final bool success;
  final String? errorMessage;

  UpdateUserTopicsResponse({required this.success, this.errorMessage});

  factory UpdateUserTopicsResponse.fromEntity(
      UpdateUserTopicsResponseEntity entity) {
    return UpdateUserTopicsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  UpdateUserTopicsResponseEntity toEntity() {
    return UpdateUserTopicsResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class UpdateUserTopicsResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  UpdateUserTopicsResponseEntity({
    required this.success,
    required this.errorMessage,
  });

  factory UpdateUserTopicsResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$UpdateUserTopicsResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$UpdateUserTopicsResponseEntityToJson(this);
}
