// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed_feedroom_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedOfFeedRoomRequestEntity _$GetFeedOfFeedRoomRequestEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedOfFeedRoomRequestEntity(
      page: json['page'] as int,
      pageSize: json['page_size'] as int,
      feedroomId: json['feedroom_id'] as int,
    );

Map<String, dynamic> _$GetFeedOfFeedRoomRequestEntityToJson(
        GetFeedOfFeedRoomRequestEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'feedroom_id': instance.feedroomId,
    };
