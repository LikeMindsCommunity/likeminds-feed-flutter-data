import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'add_comment_response.g.dart';

class AddCommentResponse {
  final bool success;
  final String? errorMessage;
  final Comment? reply;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;
  final Map<String, List<String>>? userTopics;

  AddCommentResponse({
    required this.success,
    this.errorMessage,
    this.reply,
    this.users,
    this.userTopics,
    this.topics,
    this.widgets,
  });

  factory AddCommentResponse.fromEntity(AddCommentResponseEntity entity) {
    return AddCommentResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      reply: entity.reply,
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
class AddCommentResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final Comment? reply;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModelEntity>? widgets;
  final Map<String, List<String>>? userTopics;

  AddCommentResponseEntity({
    required this.success,
    this.errorMessage,
    this.reply,
    this.users,
    this.topics,
    this.widgets,
    this.userTopics,
  });

  factory AddCommentResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$AddCommentResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddCommentResponseEntityToJson(this);
}
