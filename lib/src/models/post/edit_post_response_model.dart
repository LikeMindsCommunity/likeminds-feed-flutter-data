import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'edit_post_response_model.g.dart';

class EditPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? user;

  EditPostResponse({
    required this.success,
    this.errorMessage,
    this.post,
    this.user,
  });

  factory EditPostResponse.fromEntity(EditPostResponseEntity entity) {
    return EditPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post,
      user: entity.users,
    );
  }

  EditPostResponseEntity toEntity() {
    return EditPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      post: post,
      users: user,
    );
  }
}

@JsonSerializable()
class EditPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? users;

  EditPostResponseEntity({
    required this.success,
    this.errorMessage,
    this.post,
    this.users,
  });

  factory EditPostResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditPostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditPostResponseEntityToJson(this);
}
