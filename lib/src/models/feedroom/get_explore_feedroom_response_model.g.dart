// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_feedroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreFeedRoomResponseEntity _$GetExploreFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreFeedRoomResponseEntity(
      chatrooms: (json['chatrooms'] as List<dynamic>)
          .map((e) => ChatroomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinnedChatroomsCount: json['pinned_chatrooms_count'] as int,
      widgets:
          WidgetModelEntity.fromJson(json['widgets'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetExploreFeedResponseEntityToJson(
        GetExploreFeedRoomResponseEntity instance) =>
    <String, dynamic>{
      'chatrooms': instance.chatrooms,
      'pinned_chatrooms_count': instance.pinnedChatroomsCount,
      'widgets': instance.widgets,
    };
