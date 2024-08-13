import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_explore_feedroom_response_model.g.dart';

class GetExploreFeedRoomResponse {
  List<Chatroom> chatrooms;
  int pinnedChatroomsCount;
  WidgetModel widgets;

  GetExploreFeedRoomResponse({
    required this.chatrooms,
    required this.pinnedChatroomsCount,
    required this.widgets,
  });

  factory GetExploreFeedRoomResponse.fromEntity(
      GetExploreFeedRoomResponseEntity entity) {
    return GetExploreFeedRoomResponse(
      chatrooms: entity.chatrooms.map((e) => Chatroom.fromEntity(e)).toList(),
      pinnedChatroomsCount: entity.pinnedChatroomsCount,
      widgets: WidgetModel.fromEntity(entity.widgets),
    );
  }

  GetExploreFeedRoomResponseEntity toEntity() {
    return GetExploreFeedRoomResponseEntity(
      chatrooms: chatrooms.map((e) => e.toEntity()).toList(),
      pinnedChatroomsCount: pinnedChatroomsCount,
      widgets: widgets.toEntity(),
    );
  }
}

@JsonSerializable()
class GetExploreFeedRoomResponseEntity {
  @JsonKey(name: 'chatrooms')
  final List<ChatroomEntity> chatrooms;
  @JsonKey(name: 'pinned_chatrooms_count')
  final int pinnedChatroomsCount;
  final WidgetModelEntity widgets;

  GetExploreFeedRoomResponseEntity({
    required this.chatrooms,
    required this.pinnedChatroomsCount,
    required this.widgets,
  });

  factory GetExploreFeedRoomResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetExploreFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetExploreFeedResponseEntityToJson(this);
}
