import 'package:feed_sdk/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_post_response_model.g.dart';

class GetPostResponse {
  final bool success;
  final String? errorMessage;
  final Post? post;
  final Map<String, PostUser> users;

  GetPostResponse({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.users,
  });

  factory GetPostResponse.fromEntity({required GetPostResponseEntity entity}) {
    return GetPostResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      post: entity.post != null
          ? Post.fromEntity(postEntity: entity.post!)
          : null,
      users: entity.users.map((key, value) {
        return MapEntry(key, PostUser.fromEntity(entity: value));
      }),
    );
  }

  GetPostResponseEntity toEntity() {
    return GetPostResponseEntity(
      success: success,
      errorMessage: errorMessage,
      post: post != null ? post!.toEntity() : null,
      users: users.map((key, value) {
        return MapEntry(key, value.toEntity());
      }),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetPostResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final PostEntity? post;
  final Map<String, PostUserEntity> users;

  GetPostResponseEntity({
    required this.success,
    required this.errorMessage,
    required this.post,
    required this.users,
  });

  factory GetPostResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetPostResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetPostResponseEntityToJson(this);
}
