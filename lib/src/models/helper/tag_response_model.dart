import 'package:json_annotation/json_annotation.dart';

import 'package:likeminds_feed/src/models/models.dart';

part 'tag_response_model.g.dart';

class GetTaggingListResponse {
  final bool success;
  final String? errorMessage;
  final List<GroupTag>? groupTags;
  final List<UserTag>? members;

  GetTaggingListResponse({
    required this.success,
    this.errorMessage,
    this.groupTags,
    this.members,
  });

  factory GetTaggingListResponse.fromEntity(
      GetTaggingListResponseEntity entity) {
    return GetTaggingListResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      groupTags: entity.groupTags?.map((e) => GroupTag.fromEntity(e)).toList(),
      members: entity.members?.map((e) => UserTag.fromEntity(e)).toList(),
    );
  }

  GetTaggingListResponseEntity toEntity() {
    return GetTaggingListResponseEntity(
      success: success,
      errorMessage: errorMessage,
      groupTags: groupTags?.map((e) => e.toEntity()).toList(),
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetTaggingListResponseEntity {
  final bool success;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  @JsonKey(name: 'group_tags')
  final List<GroupTagEntity>? groupTags;

  @JsonKey(name: 'community_members')
  final List<UserTagEntity>? members;

  GetTaggingListResponseEntity({
    required this.success,
    this.errorMessage,
    this.groupTags,
    this.members,
  });

  factory GetTaggingListResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTaggingListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTaggingListResponseEntityToJson(this);
}
