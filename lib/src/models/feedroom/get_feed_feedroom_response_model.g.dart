// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed_feedroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedOfFeedRoomResponseEntity _$GetFeedOfFeedRoomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedOfFeedRoomResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      posts: (json['data']['posts'] as List<dynamic>?)
          ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
    );

Map<String, dynamic> _$GetFeedOfFeedRoomResponseEntityToJson(
        GetFeedOfFeedRoomResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'posts': instance.posts,
      'users': instance.users,
      'topics': instance.topics,
    };
