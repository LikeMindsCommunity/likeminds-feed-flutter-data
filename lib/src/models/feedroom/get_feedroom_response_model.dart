import 'package:json_annotation/json_annotation.dart';

part 'get_feedroom_response_model.g.dart';

class GetFeedRoomResponse {
  final bool success;
  final Map<String, dynamic>? chatroom;
  final int? participantCount;
  final String? errorMessage;

  GetFeedRoomResponse({
    required this.success,
    required this.chatroom,
    required this.participantCount,
    required this.errorMessage,
  });

  factory GetFeedRoomResponse.fromEntity(GetFeedRoomResponseEntity entity) {
    return GetFeedRoomResponse(
      success: entity.success,
      chatroom: entity.chatroom,
      participantCount: entity.participantCount,
      errorMessage: entity.errorMessage,
    );
  }

  GetFeedRoomResponseEntity toEntity() {
    return GetFeedRoomResponseEntity(
      success: success,
      chatroom: chatroom,
      participantCount: participantCount,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class GetFeedRoomResponseEntity {
  final bool success;
  final Map<String, dynamic>? chatroom;
  @JsonKey(name: 'participant_count')
  final int? participantCount;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  GetFeedRoomResponseEntity({
    required this.success,
    required this.chatroom,
    required this.participantCount,
    required this.errorMessage,
  });

  factory GetFeedRoomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedRoomResponseEntityToJson(this);
}
