// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_poll_votes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVotesResponseEntity _$GetVotesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetVotesResponseEntity(
      topics: (json['topics'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, TopicEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userTopics: (json['user_topics'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      widgets: (json['widgets'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, WidgetModelEntity.fromJson(e as Map<String, dynamic>)),
      ),
      votes: (json['votes'] as List<dynamic>)
          .map((e) => VoteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetVotesResponseEntityToJson(
        GetVotesResponseEntity instance) =>
    <String, dynamic>{
      'topics': instance.topics,
      'user_topics': instance.userTopics,
      'users': instance.users,
      'widgets': instance.widgets,
      'votes': instance.votes,
    };

VoteEntity _$VoteEntityFromJson(Map<String, dynamic> json) => VoteEntity(
      id: json['_id'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VoteEntityToJson(VoteEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'users': instance.users,
    };
