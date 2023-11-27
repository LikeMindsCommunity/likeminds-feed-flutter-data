class PushLogResponse {
  bool success;
  String? errorMessage;

  PushLogResponse({required this.success, this.errorMessage});

  factory PushLogResponse.fromEntity(PushLogResponseEntity entity) {
    return PushLogResponse(
        success: entity.success, errorMessage: entity.errorMessage);
  }

  PushLogResponseEntity toEntity() {
    return PushLogResponseEntity(success: success, errorMessage: errorMessage);
  }
}

class PushLogResponseEntity {
  bool success;
  String? errorMessage;

  PushLogResponseEntity({required this.success, this.errorMessage});

  factory PushLogResponseEntity.fromJson(Map<String, dynamic> json) {
    return PushLogResponseEntity(
        success: json['success'], errorMessage: json['error_message']);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'error_message': errorMessage};
  }
}
