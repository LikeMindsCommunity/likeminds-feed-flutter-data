import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_explore_feedroom_response_model.g.dart';

class GetExploreFeedRoomResponse {
  final List<FeedRoom>? chatrooms;
  final int? pinnedChatroomsCount;
  final Map<String, WidgetModel>? widgets;
  final Map<String, int>? postCounts;

  GetExploreFeedRoomResponse({
    this.chatrooms,
    this.pinnedChatroomsCount,
    this.widgets,
    this.postCounts,
  });

  factory GetExploreFeedRoomResponse.fromEntity(
      GetExploreFeedRoomResponseEntity entity) {
    return GetExploreFeedRoomResponse(
      chatrooms: entity.chatrooms?.map((e) => FeedRoom.fromEntity(e)).toList(),
      pinnedChatroomsCount: entity.pinnedChatroomsCount,
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      postCounts: entity.postCounts,
    );
  }

  GetExploreFeedRoomResponseEntity toEntity() {
    return GetExploreFeedRoomResponseEntity(
      chatrooms: chatrooms?.map((e) => e.toEntity()).toList(),
      pinnedChatroomsCount: pinnedChatroomsCount,
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      postCounts: postCounts,
    );
  }
}

@JsonSerializable()
class GetExploreFeedRoomResponseEntity {
  @JsonKey(name: 'chatrooms')
  final List<FeedRoomEntity>? chatrooms;
  @JsonKey(name: 'pinned_chatrooms_count')
  final int? pinnedChatroomsCount;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'post_counts')
  final Map<String, int>? postCounts;

  GetExploreFeedRoomResponseEntity({
    this.chatrooms,
    this.pinnedChatroomsCount,
    this.widgets,
    this.postCounts,
  });

  factory GetExploreFeedRoomResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetExploreFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetExploreFeedRoomResponseEntityToJson(this);
}
