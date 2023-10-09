class PostReportResponse {
  bool success;
  String? errorMessage;

  PostReportResponse({required this.success, this.errorMessage});

  PostReportResponseEntity toEntity() {
    return PostReportResponseEntity(
        success: success, errorMessage: errorMessage);
  }

  factory PostReportResponse.fromEntity(PostReportResponseEntity entity) {
    return PostReportResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }
}

class PostReportResponseEntity {
  bool success;
  String? errorMessage;

  PostReportResponseEntity({required this.success, this.errorMessage});

  factory PostReportResponseEntity.fromJson(Map<String, dynamic> json) {
    return PostReportResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['error_message'] = errorMessage;
    return data;
  }
}
