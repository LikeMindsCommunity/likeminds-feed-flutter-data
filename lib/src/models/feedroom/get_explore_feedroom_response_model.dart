import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed/src/models/feedroom/chatroom_model.dart';

part 'get_explore_feedroom_response_model.g.dart';

class GetExploreFeedroomResponse {
  List<Chatroom> chatrooms;
  int pinnedChatroomsCount;
  WidgetModel widgets;

  GetExploreFeedroomResponse({
    required this.chatrooms,
    required this.pinnedChatroomsCount,
    required this.widgets,
  });

  factory GetExploreFeedroomResponse.fromEntity(
      GetExploreFeedroomResponseEntity entity) {
    return GetExploreFeedroomResponse(
      chatrooms: entity.chatrooms.map((e) => Chatroom.fromEntity(e)).toList(),
      pinnedChatroomsCount: entity.pinnedChatroomsCount,
      widgets: WidgetModel.fromEntity(entity.widgets),
    );
  }

  GetExploreFeedroomResponseEntity toEntity() {
    return GetExploreFeedroomResponseEntity(
      chatrooms: chatrooms.map((e) => e.toEntity()).toList(),
      pinnedChatroomsCount: pinnedChatroomsCount,
      widgets: widgets.toEntity(),
    );
  }
}

@JsonSerializable()
class GetExploreFeedroomResponseEntity {
  @JsonKey(name: 'chatrooms')
  final List<ChatroomEntity> chatrooms;
  @JsonKey(name: 'pinned_chatrooms_count')
  final int pinnedChatroomsCount;
  final WidgetModelEntity widgets;

  GetExploreFeedroomResponseEntity({
    required this.chatrooms,
    required this.pinnedChatroomsCount,
    required this.widgets,
  });

  factory GetExploreFeedroomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetExploreFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetExploreFeedResponseEntityToJson(this);
}
