import 'package:likeminds_feed/likeminds_feed.dart';

class GetTopicsResponse {
  final bool success;
  final String? errorMessage;
  final List<Topic>? topics;

  GetTopicsResponse({
    required this.success,
    this.errorMessage,
    this.topics,
  });

  factory GetTopicsResponse.fromEntity(GetTopicsResponseEntity entity) {
    return GetTopicsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      topics: entity.topics?.map((e) => Topic.fromEntity(e)).toList(),
    );
  }

  GetTopicsResponseEntity toEntity(GetTopicsResponse response) {
    return GetTopicsResponseEntity(
      success: response.success,
      errorMessage: response.errorMessage,
      topics: response.topics?.map((e) => e.toEntity()).toList(),
    );
  }
}

class GetTopicsResponseEntity {
  final bool success;
  final String? errorMessage;
  final List<TopicEntity>? topics;

  GetTopicsResponseEntity({
    required this.success,
    this.errorMessage,
    this.topics,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error_message': errorMessage,
      'topics': topics?.map((e) => e.toJson()).toList(),
    };
  }
}
