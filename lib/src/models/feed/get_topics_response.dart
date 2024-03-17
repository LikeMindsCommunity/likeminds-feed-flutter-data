import 'package:likeminds_feed/likeminds_feed.dart';

class GetTopicsResponse {
  final bool success;
  final String? errorMessage;
  final List<Topic>? topics;
  final Map<String, dynamic>? widgets;
  final Map<String, List<Topic>>? childTopics;

  GetTopicsResponse({
    required this.success,
    this.errorMessage,
    this.topics,
    this.widgets,
    this.childTopics,
  });

  factory GetTopicsResponse.fromEntity(GetTopicsResponseEntity entity) {
    return GetTopicsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      topics: entity.topics?.map((e) => Topic.fromEntity(e)).toList(),
      childTopics: entity.childTopics?.map((key, value) => MapEntry(
            key,
            value.map((e) => Topic.fromEntity(e)).toList(),
          )),
      widgets: entity.widgets,
    );
  }

  GetTopicsResponseEntity toEntity() {
    return GetTopicsResponseEntity(
      success: success,
      errorMessage: errorMessage,
      topics: topics?.map((e) => e.toEntity()).toList(),
    );
  }
}

class GetTopicsResponseEntity {
  final bool success;
  final String? errorMessage;
  final List<TopicEntity>? topics;
  final Map<String, dynamic>? widgets;
  final Map<String, List<TopicEntity>>? childTopics;

  GetTopicsResponseEntity({
    required this.success,
    this.errorMessage,
    this.topics,
    this.widgets,
    this.childTopics,
  });

  factory GetTopicsResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetTopicsResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      topics: json['data']['topics'] != null
          ? (json['data']['topics'] as List)
              .map((e) => TopicEntity.fromJson(e))
              .toList()
          : null,
      widgets: json['data']['widgets'],
      childTopics: json['data']['child_topics'] != null
          ? (json['data']['child_topics'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(
                key,
                (value as List).map((e) => TopicEntity.fromJson(e)).toList(),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error_message': errorMessage,
      'data': {
        'topics': topics?.map((e) => e.toJson()).toList(),
        'widgets': widgets,
        'child_topics': childTopics
            ?.map((key, value) => MapEntry(key, value.map((e) => e.toJson()))),
      }
    };
  }
}
