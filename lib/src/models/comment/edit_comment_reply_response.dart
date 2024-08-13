import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'edit_comment_reply_response.g.dart';

class EditCommentReplyResponse {
  final bool success;
  final String? errorMessage;
  final Comment? reply;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;

  EditCommentReplyResponse({
    required this.success,
    this.errorMessage,
    this.reply,
    this.users,
    this.userTopics,
    this.topics,
    this.widgets,
  });

  factory EditCommentReplyResponse.fromEntity(
      EditCommentReplyResponseEntity entity) {
    return EditCommentReplyResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply != null
          ? Comment.fromEntity(commentEntity: entity.reply!)
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

@JsonSerializable()
class EditCommentReplyResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final CommentEntity? reply;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;

  EditCommentReplyResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
    this.users,
    this.topics,
    this.widgets,
    this.userTopics,
  });

  factory EditCommentReplyResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$EditCommentReplyResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$EditCommentReplyResponseEntityToJson(this);
}
