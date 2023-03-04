// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feedroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedRoomResponseEntity _$GetFeedRoomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedRoomResponseEntity(
      success: json['success'] as bool,
      chatroom: json['data']['chatroom'] == null
          ? null
          : FeedRoomEntity.fromJson(
              json['data']['chatroom'] as Map<String, dynamic>),
      participantCount: json['data']['participant_count'] as int?,
      errorMessage: json['error_message'] as String?,
      chatrooms: (json['data']['chatrooms'] as List<dynamic>?)
          ?.map((e) => FeedRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFeedRoomResponseEntityToJson(
        GetFeedRoomResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'chatroom': instance.chatroom,
      'participant_count': instance.participantCount,
      'error_message': instance.errorMessage,
      'chatrooms': instance.chatrooms,
    };
