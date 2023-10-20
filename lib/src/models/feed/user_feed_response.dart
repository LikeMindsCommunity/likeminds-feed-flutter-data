import 'package:likeminds_feed/src/models/models.dart';

class GetUserFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<Post>? posts;
  final Map<String, User>? users;
  final Map<String, Topic>? topics;
  final Map<String, WidgetModel>? widgets;

  GetUserFeedResponse({
    required this.success,
    this.errorMessage,
    this.posts,
    this.users,
    this.topics,
    this.widgets,
  });

  factory GetUserFeedResponse.fromEntity(
      {required GetUserFeedResponseEntity entity}) {
    return GetUserFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      posts: entity.posts?.map((e) => Post.fromEntity(postEntity: e)).toList(),
      users: entity.users
          ?.map((key, value) => MapEntry(key, User.fromEntity(value))),
      topics: entity.topics
          ?.map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      widgets: entity.widgets,
    );
  }
}

class GetUserFeedResponseEntity {
  final String? errorMessage;
  final bool success;
  final List<PostEntity>? posts;
  final Map<String, UserEntity>? users;
  final Map<String, TopicEntity>? topics;
  final Map<String, WidgetModel>? widgets;

  GetUserFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.posts,
    this.users,
    this.topics,
    this.widgets,
  });
  factory GetUserFeedResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetUserFeedResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetUserFeedResponseEntityToJson(this);
}

GetUserFeedResponseEntity _$GetUserFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetUserFeedResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'] as String?,
      posts: (json['data']['posts'] as List<dynamic>)
          .map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['data']['widgets'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            WidgetModel.fromEntity(
                WidgetModelEntity.fromJson(e as Map<String, dynamic>))),
      ),
    );

Map<String, dynamic> _$GetUserFeedResponseEntityToJson(
        GetUserFeedResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'posts': instance.posts?.map((e) => e.toJson()).toList(),
      'users': instance.users?.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics?.map((k, e) => MapEntry(k, e.toJson())),
    };
