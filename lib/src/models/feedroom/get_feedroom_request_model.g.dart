// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feedroom_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedRoomRequestEntity _$GetFeedRoomRequestEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedRoomRequestEntity(
      page: json['page'] as int,
      feedroomId: json['feedroom_id'] as int?,
    );

Map<String, dynamic> _$GetFeedRoomRequestEntityToJson(
        GetFeedRoomRequestEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'feedroom_id': instance.feedroomId,
    };
