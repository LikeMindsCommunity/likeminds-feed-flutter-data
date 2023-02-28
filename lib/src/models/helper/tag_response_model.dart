import 'package:json_annotation/json_annotation.dart';

import 'package:likeminds_feed/src/models/models.dart';

part 'tag_response_model.g.dart';

class TagResponseModel {
  final bool success;
  final String? errorMessage;
  final List<GroupTag>? groupTags;
  final List<UserTag>? members;

  TagResponseModel({
    required this.success,
    this.errorMessage,
    this.groupTags,
    this.members,
  });

  factory TagResponseModel.fromEntity(TagResponseModelEntity entity) {
    return TagResponseModel(
      success: entity.success,
      errorMessage: entity.errorMessage,
      groupTags: entity.groupTags?.map((e) => GroupTag.fromEntity(e)).toList(),
      members: entity.members?.map((e) => UserTag.fromEntity(e)).toList(),
    );
  }

  TagResponseModelEntity toEntity() {
    return TagResponseModelEntity(
      success: success,
      errorMessage: errorMessage,
      groupTags: groupTags?.map((e) => e.toEntity()).toList(),
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class TagResponseModelEntity {
  final bool success;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  @JsonKey(name: 'group_tags')
  final List<GroupTagEntity>? groupTags;

  @JsonKey(name: 'community_members')
  final List<UserTagEntity>? members;

  TagResponseModelEntity({
    required this.success,
    this.errorMessage,
    this.groupTags,
    this.members,
  });

  factory TagResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      _$TagResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TagResponseModelEntityToJson(this);
}
