import 'package:json_annotation/json_annotation.dart';

part 'mark_read_notification_response_model.g.dart';

class MarkReadNotificationResponse {
  final bool success;
  final String? errorMessage;

  MarkReadNotificationResponse({
    required this.success,
    this.errorMessage,
  });

  factory MarkReadNotificationResponse.fromEntity(
      MarkReadNotificationResponseEntity entity) {
    return MarkReadNotificationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  MarkReadNotificationResponseEntity toEntity() {
    return MarkReadNotificationResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class MarkReadNotificationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  MarkReadNotificationResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory MarkReadNotificationResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$MarkReadNotificationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MarkReadNotificationResponseEntityToJson(this);
}
