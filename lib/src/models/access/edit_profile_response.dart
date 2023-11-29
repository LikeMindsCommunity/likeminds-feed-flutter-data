class EditProfileResponse {
  final String? errorMessage;
  final bool success;

  EditProfileResponse({this.errorMessage, required this.success});

  factory EditProfileResponse.fromEntity(EditProfileResponseEntity entity) {
    return EditProfileResponse(
        errorMessage: entity.errorMessage, success: entity.success);
  }
}

class EditProfileResponseEntity {
  final String? errorMessage;
  final bool success;

  EditProfileResponseEntity({this.errorMessage, required this.success});

  factory EditProfileResponseEntity.fromJson(Map<String, dynamic> json) {
    return EditProfileResponseEntity(
        errorMessage: json['error_message'], success: json['success']);
  }
}
