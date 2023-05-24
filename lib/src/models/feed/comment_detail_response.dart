// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_detail_response.g.dart';

class GetCommentResponse {
  final bool success;
  final String? errorMessage;
  final CommentReplies? postReplies;
  final Map<String, User>? users;
  GetCommentResponse({
    this.postReplies,
    this.errorMessage,
    required this.success,
    this.users,
  });
  factory GetCommentResponse.fromEntity(GetCommentResponseEntity entity) {
    return GetCommentResponse(
        success: entity.success,
        errorMessage: entity.errorMessage,
        postReplies: entity.postReplies != null
            ? CommentReplies.fromEntity(entity.postReplies!)
            : null,
        users: entity.users != null
            ? entity.users!
                .map((key, value) => MapEntry(key, User.fromEntity(value)))
            : null);
  }
}

@JsonSerializable(explicitToJson: true)
class GetCommentResponseEntity {
  final bool success;
  final String? errorMessage;
  @JsonKey(name: 'comment')
  final CommentRepliesEntity? postReplies;
  final Map<String, UserEntity>? users;
  GetCommentResponseEntity({
    this.postReplies,
    required this.success,
    this.errorMessage,
    this.users,
  });
  factory GetCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetCommentResponseEntityToJson(this);
}
