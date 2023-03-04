import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'get_feedroom_response_model.g.dart';

class GetFeedRoomResponse {
  final bool success;
  final FeedRoom? chatroom;
  final List<FeedRoom>? chatrooms;
  final int? participantCount;
  final String? errorMessage;

  GetFeedRoomResponse({
    required this.success,
    required this.chatroom,
    required this.participantCount,
    required this.errorMessage,
    this.chatrooms,
  });

  factory GetFeedRoomResponse.fromEntity(GetFeedRoomResponseEntity entity) {
    return GetFeedRoomResponse(
      success: entity.success,
      chatroom: entity.chatroom != null
          ? FeedRoom.fromEntity(entity.chatroom!)
          : null,
      participantCount: entity.participantCount,
      errorMessage: entity.errorMessage,
      chatrooms: entity.chatrooms != null
          ? entity.chatrooms!.map((e) => FeedRoom.fromEntity(e)).toList()
          : null,
    );
  }

  GetFeedRoomResponseEntity toEntity() {
    return GetFeedRoomResponseEntity(
      success: success,
      chatroom: chatroom!.toEntity(),
      participantCount: participantCount,
      errorMessage: errorMessage,
      chatrooms: chatrooms!.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetFeedRoomResponseEntity {
  final bool success;
  final FeedRoomEntity? chatroom;
  @JsonKey(name: 'participant_count')
  final int? participantCount;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'chatrooms')
  final List<FeedRoomEntity>? chatrooms;

  GetFeedRoomResponseEntity({
    required this.success,
    required this.chatroom,
    required this.participantCount,
    required this.errorMessage,
    this.chatrooms,
  });

  factory GetFeedRoomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedRoomResponseEntityToJson(this);
}
