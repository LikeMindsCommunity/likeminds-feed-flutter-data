import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/src/models/models.dart';

part 'get_explore_feedroom_response_model.g.dart';

class GetExploreFeedRoomResponse {
  final List<FeedRoom>? feedrooms;
  final int? pinnedFeedroomsCount;
  final Map<String, WidgetModel>? widgets;
  final Map<String, int>? postCounts;

  GetExploreFeedRoomResponse({
    this.feedrooms,
    this.pinnedFeedroomsCount,
    this.widgets,
    this.postCounts,
  });

  factory GetExploreFeedRoomResponse.fromEntity(
      GetExploreFeedRoomResponseEntity entity) {
    return GetExploreFeedRoomResponse(
      feedrooms: entity.feedrooms?.map((e) => FeedRoom.fromEntity(e)).toList(),
      pinnedFeedroomsCount: entity.pinnedFeedroomsCount,
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      postCounts: entity.postCounts,
    );
  }

  GetExploreFeedRoomResponseEntity toEntity() {
    return GetExploreFeedRoomResponseEntity(
      feedrooms: feedrooms?.map((e) => e.toEntity()).toList(),
      pinnedFeedroomsCount: pinnedFeedroomsCount,
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
      postCounts: postCounts,
    );
  }
}

@JsonSerializable()
class GetExploreFeedRoomResponseEntity {
  @JsonKey(name: 'chatrooms')
  final List<FeedRoomEntity>? feedrooms;
  @JsonKey(name: 'pinned_chatrooms_count')
  final int? pinnedFeedroomsCount;
  final Map<String, WidgetModelEntity>? widgets;
  @JsonKey(name: 'post_counts')
  final Map<String, int>? postCounts;

  GetExploreFeedRoomResponseEntity({
    this.feedrooms,
    this.pinnedFeedroomsCount,
    this.widgets,
    this.postCounts,
  });

  factory GetExploreFeedRoomResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetExploreFeedRoomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetExploreFeedRoomResponseEntityToJson(this);
}
