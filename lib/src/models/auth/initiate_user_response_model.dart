import 'package:json_annotation/json_annotation.dart';

part 'initiate_user_response_model.g.dart';

@JsonSerializable()
class InitiateUserResponse {
  final bool success;
  final Map<String, dynamic>? data;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  InitiateUserResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory InitiateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserResponseToJson(this);

  @override
  String toString() =>
      "InitiateUserResponse: {success: $success, data: $data, errorMessage: $errorMessage}";
}
