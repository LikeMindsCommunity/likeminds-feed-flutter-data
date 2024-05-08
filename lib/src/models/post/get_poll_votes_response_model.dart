import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
part 'get_poll_votes_response_model.g.dart';

class GetPollVotesResponse {
  final Map<String, Topic> topics;
  final Map<String, List<String>>? userTopics;
  final Map<String, User> users;
  final Map<String, WidgetModel> widgets;
  final List<Vote> votes;

  GetPollVotesResponse({
    required this.topics,
    required this.userTopics,
    required this.users,
    required this.widgets,
    required this.votes,
  });

  GetPollVotesResponseEntity toEntity() {
    return GetPollVotesResponseEntity(
      topics: topics.map((key, value) => MapEntry(key, value.toEntity())),
      userTopics: userTopics,
      users: users.map((key, value) => MapEntry(key, value.toEntity())),
      widgets: widgets.map((key, value) => MapEntry(key, value.toEntity())),
      votes: votes.map((e) => e.toEntity()).toList(),
    );
  }

  factory GetPollVotesResponse.fromEntity(GetPollVotesResponseEntity entity) {
    return GetPollVotesResponse(
      topics: entity.topics
          .map((key, value) => MapEntry(key, Topic.fromEntity(value))),
      userTopics: entity.userTopics,
      users: entity.users
          .map((key, value) => MapEntry(key, User.fromEntity(value))),
      widgets: entity.widgets
          .map((key, value) => MapEntry(key, WidgetModel.fromEntity(value))),
      votes: entity.votes.map((e) => Vote.fromEntity(e)).toList(),
    );
  }
}

class Vote {
  final String id;
  final List<String> users;

  Vote({
    required this.id,
    required this.users,
  });

  VoteEntity toEntity() {
    return VoteEntity(
      id: id,
      users: users,
    );
  }

  factory Vote.fromEntity(VoteEntity entity) {
    return Vote(
      id: entity.id,
      users: entity.users,
    );
  }
}

@JsonSerializable()
class GetPollVotesResponseEntity {
  final Map<String, TopicEntity> topics;
  @JsonKey(name: 'user_topics')
  final Map<String, List<String>>? userTopics;
  final Map<String, UserEntity> users;
  final Map<String, WidgetModelEntity> widgets;
  final List<VoteEntity> votes;

  GetPollVotesResponseEntity({
    required this.topics,
    required this.userTopics,
    required this.users,
    required this.widgets,
    required this.votes,
  });

  factory GetPollVotesResponseEntity.fromJson(Map<String, dynamic> data) =>
      _$GetVotesResponseEntityFromJson(data);

  Map<String, dynamic> toJson() => _$GetVotesResponseEntityToJson(this);
}

@JsonSerializable()
class VoteEntity {
  @JsonKey(name: '_id')
  final String id;
  final List<String> users;

  VoteEntity({
    required this.id,
    required this.users,
  });

  factory VoteEntity.fromJson(Map<String, dynamic> data) =>
      _$VoteEntityFromJson(data);

  Map<String, dynamic> toJson() => _$VoteEntityToJson(this);
}
