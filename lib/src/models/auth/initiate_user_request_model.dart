import 'package:json_annotation/json_annotation.dart';

part 'initiate_user_request_model.g.dart';

@JsonSerializable()
class InitiateUserRequest {
  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'user_unique_id')
  final String? userId;

  @JsonKey(name: 'is_guest')
  final bool? isGuest;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'x-api-key')
  final String? apiKey;

  InitiateUserRequest(
      {this.userName, this.userId, this.isGuest, this.imageUrl, this.apiKey});

  factory InitiateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserRequestToJson(this);
}
