import 'package:json_annotation/json_annotation.dart';

part 'get_unread_notification_count_response_model.g.dart';

class GetUnreadNotificationCountResponse {
  final bool success;
  final String? errorMessage;
  final int? count;

  GetUnreadNotificationCountResponse({
    required this.success,
    this.errorMessage,
    this.count,
  });

  factory GetUnreadNotificationCountResponse.fromEntity(
      GetUnreadNotificationCountResponseEntity entity) {
    return GetUnreadNotificationCountResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      count: entity.count,
    );
  }

  GetUnreadNotificationCountResponseEntity toEntity() {
    return GetUnreadNotificationCountResponseEntity(
      success: success,
      errorMessage: errorMessage,
      count: count,
    );
  }
}

@JsonSerializable()
class GetUnreadNotificationCountResponseEntity {
  final bool success;
  final String? errorMessage;
  final int? count;

  GetUnreadNotificationCountResponseEntity({
    required this.success,
    this.errorMessage,
    this.count,
  });

  factory GetUnreadNotificationCountResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetUnreadNotificationCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetUnreadNotificationCountResponseEntityToJson(this);
}
