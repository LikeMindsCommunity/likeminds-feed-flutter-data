// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'universal_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedResponseEntity _$GetFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetFeedResponseEntity(
      posts: (json['data']['posts'] as List<dynamic>)
          .map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['data']['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      topics: (json['data']['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GetFeedResponseEntityToJson(
        GetFeedResponseEntity instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      'users': instance.users.map((k, e) => MapEntry(k, e.toJson())),
      'topics': instance.topics.map((k, e) => MapEntry(k, e.toJson())),
    };
