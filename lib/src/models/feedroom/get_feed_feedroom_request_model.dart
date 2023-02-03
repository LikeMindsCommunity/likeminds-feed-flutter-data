import 'package:json_annotation/json_annotation.dart';

part 'get_feed_feedroom_request_model.g.dart';

class GetFeedOfFeedRoomRequest {
  final int page;
  final int pageSize;
  final int feedroomId;

  GetFeedOfFeedRoomRequest({
    required this.page,
    required this.pageSize,
    required this.feedroomId,
  });

  factory GetFeedOfFeedRoomRequest.fromEntity(
      GetFeedOfFeedRoomRequestEntity entity) {
    return GetFeedOfFeedRoomRequest(
      page: entity.page,
      pageSize: entity.pageSize,
      feedroomId: entity.feedroomId,
    );
  }

  GetFeedOfFeedRoomRequestEntity toEntity() {
    return GetFeedOfFeedRoomRequestEntity(
      page: page,
      pageSize: pageSize,
      feedroomId: feedroomId,
    );
  }
}

@JsonSerializable()
class GetFeedOfFeedRoomRequestEntity {
  final int page;
  @JsonKey(name: 'page_size')
  final int pageSize;
  @JsonKey(name: 'feedroom_id')
  final int feedroomId;

  GetFeedOfFeedRoomRequestEntity({
    required this.page,
    required this.pageSize,
    required this.feedroomId,
  });

  factory GetFeedOfFeedRoomRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedOfFeedRoomRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedOfFeedRoomRequestEntityToJson(this);
}
