import 'package:json_annotation/json_annotation.dart';

part 'get_feedroom_request_model.g.dart';

class GetFeedRoomRequest {
  final int page;
  final int? feedroomId;

  GetFeedRoomRequest({required this.page, required this.feedroomId});

  factory GetFeedRoomRequest.fromEntity(GetFeedRoomRequestEntity entity) {
    return GetFeedRoomRequest(
      page: entity.page,
      feedroomId: entity.feedroomId,
    );
  }

  GetFeedRoomRequestEntity toEntity() {
    return GetFeedRoomRequestEntity(
      page: page,
      feedroomId: feedroomId,
    );
  }
}

@JsonSerializable()
class GetFeedRoomRequestEntity {
  final int page;
  @JsonKey(name: 'feedroom_id')
  final int? feedroomId;

  GetFeedRoomRequestEntity({required this.page, required this.feedroomId});

  factory GetFeedRoomRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$GetFeedRoomRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetFeedRoomRequestEntityToJson(this);
}
