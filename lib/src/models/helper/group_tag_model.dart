import 'package:json_annotation/json_annotation.dart';

part 'group_tag_model.g.dart';

class GroupTag {
  final String? description;
  final String? imageUrl;
  final String? name;
  final String? route;
  final String? tag;

  GroupTag({
    this.description,
    this.imageUrl,
    this.name,
    this.route,
    this.tag,
  });

  factory GroupTag.fromEntity(GroupTagEntity entity) {
    return GroupTag(
      description: entity.description,
      imageUrl: entity.imageUrl,
      name: entity.name,
      route: entity.route,
      tag: entity.tag,
    );
  }

  GroupTagEntity toEntity() {
    return GroupTagEntity(
      description: description,
      imageUrl: imageUrl,
      name: name,
      route: route,
      tag: tag,
    );
  }
}

@JsonSerializable()
class GroupTagEntity {
  final String? description;
  final String? name;
  final String? route;
  final String? tag;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  GroupTagEntity({
    this.description,
    this.imageUrl,
    this.name,
    this.route,
    this.tag,
  });

  factory GroupTagEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GroupTagEntityToJson(this);
}
