// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_feedroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreFeedRoomResponseEntity _$GetExploreFeedRoomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreFeedRoomResponseEntity(
      feedrooms: (json['chatrooms'] as List<dynamic>?)
          ?.map((e) => FeedRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinnedFeedroomsCount: json['pinned_chatrooms_count'] as int?,
      widgets: (json['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      postCounts: (json['post_counts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
    );

Map<String, dynamic> _$GetExploreFeedRoomResponseEntityToJson(
        GetExploreFeedRoomResponseEntity instance) =>
    <String, dynamic>{
      'chatrooms': instance.feedrooms,
      'pinned_chatrooms_count': instance.pinnedFeedroomsCount,
      'widgets': instance.widgets,
      'post_counts': instance.postCounts,
    };
