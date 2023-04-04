import 'package:json_annotation/json_annotation.dart';

part 'og_tags_model.g.dart';

class OgTags {
  final String? description;
  final String? image;
  final String? title;
  final String? url;

  OgTags({
    this.description,
    this.image,
    this.title,
    this.url,
  });

  factory OgTags.fromEntity(OgTagsEntity entity) {
    return OgTags(
      description: entity.description,
      image: entity.image,
      title: entity.title,
      url: entity.url,
    );
  }

  OgTagsEntity toEntity() {
    return OgTagsEntity(
      description: description,
      image: image,
      title: title,
      url: url,
    );
  }
}

@JsonSerializable()
class OgTagsEntity {
  final String? description;
  final String? image;
  final String? title;
  final String? url;

  OgTagsEntity({
    this.description,
    this.image,
    this.title,
    this.url,
  });

  factory OgTagsEntity.fromJson(Map<String, dynamic> json) =>
      _$OgTagsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OgTagsEntityToJson(this);
}
