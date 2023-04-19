import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'add_post_response_model.g.dart';

class AddPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, User>? user;

  AddPostResponse({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.user,
  });

  factory AddPostResponse.fromEntity({required AddPostResponseEntity entity}) {
    return AddPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post,
      user: entity.users,
    );
  }
}

@JsonSerializable()
class AddPostResponseEntity {
  final bool success;
  final Post? post;
  final Map<String, User>? users;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  AddPostResponseEntity({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.users,
  });

  factory AddPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostResponseEntityToJson(this);
}
