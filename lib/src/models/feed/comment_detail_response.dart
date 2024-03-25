// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:likeminds_feed/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_detail_response.g.dart';

class GetCommentResponse {
  final bool success;
  final String? errorMessage;
  final Comment? postReplies;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;

  GetCommentResponse({
    this.postReplies,
    this.errorMessage,
    required this.success,
    this.topics,
    this.userTopics,
    this.users,
    this.widgets,
  });

  factory GetCommentResponse.fromEntity(GetCommentResponseEntity entity) {
    return GetCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      postReplies: entity.postReplies != null
          ? Comment.fromEntity(commentEntity: entity.postReplies!)
          : null,
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      userTopics: entity.userTopics,
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class GetCommentResponseEntity {
  final bool success;
  final String? errorMessage;
  @JsonKey(name: 'comment')
  final CommentEntity? postReplies;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  final Map<String, List<String>>? userTopics;

  GetCommentResponseEntity({
    this.postReplies,
    required this.success,
    this.errorMessage,
    this.users,
    this.topics,
    this.widgets,
    this.userTopics,
  });

  factory GetCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetCommentResponseEntityToJson(this);
}
