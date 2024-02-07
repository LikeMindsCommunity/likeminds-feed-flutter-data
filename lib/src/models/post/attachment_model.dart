import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'attachment_model.g.dart';

class Attachment {
  final int attachmentType;
  final AttachmentMeta attachmentMeta;

  Attachment({
    required this.attachmentType,
    required this.attachmentMeta,
  });

  factory Attachment.fromEntity(AttachmentEntity entity) {
    return Attachment(
      attachmentType: entity.attachmentType,
      attachmentMeta: AttachmentMeta.fromEntity(entity.attachmentMetaEntity),
    );
  }

  AttachmentEntity toEntity() {
    return AttachmentEntity(
      attachmentType: attachmentType,
      attachmentMetaEntity: attachmentMeta.toEntity(),
    );
  }
}

@JsonSerializable()
class AttachmentEntity {
  @JsonKey(name: 'attachment_type')
  final int attachmentType;
  @JsonKey(name: 'attachment_meta')
  final AttachmentMetaEntity attachmentMetaEntity;

  AttachmentEntity({
    required this.attachmentType,
    required this.attachmentMetaEntity,
  });

  factory AttachmentEntity.fromJson(Map<String, dynamic> json) =>
      _$AttachmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);
}

class AttachmentMeta {
  final String? url;
  final String? format;
  final int? size;
  final int? duration;
  final int? pageCount;
  final OgTags? ogTags;
  final double? height;
  final double? width;
  final double? aspectRatio;
  final Map<String, dynamic>? meta;
  final String? entityId;

  AttachmentMeta({
    this.url,
    this.format,
    this.size,
    this.duration,
    this.pageCount,
    this.ogTags,
    this.aspectRatio,
    this.width,
    this.height,
    this.meta,
    this.entityId,
  });

  factory AttachmentMeta.fromEntity(AttachmentMetaEntity entity) {
    return AttachmentMeta(
      url: entity.url,
      format: entity.format,
      size: entity.size,
      duration: entity.duration,
      pageCount: entity.pageCount,
      height: entity.height,
      width: entity.width,
      aspectRatio: entity.aspectRatio,
      meta: entity.meta,
      ogTags: entity.ogTags != null ? OgTags.fromEntity(entity.ogTags!) : null,
      entityId: entity.entityId,
    );
  }

  AttachmentMetaEntity toEntity() {
    return AttachmentMetaEntity(
      url: url,
      format: format,
      size: size,
      duration: duration,
      pageCount: pageCount,
      height: height,
      width: width,
      aspectRatio: aspectRatio,
      meta: meta,
      ogTags: ogTags?.toEntity(),
      entityId: entityId,
    );
  }
}

@JsonSerializable()
class AttachmentMetaEntity {
  final String? url;
  final String? format;
  final int? size;
  final int? duration;
  @JsonKey(name: 'page_count')
  final int? pageCount;
  @JsonKey(name: 'og_tags')
  final OgTagsEntity? ogTags;
  final double? height;
  final double? width;
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;
  final Map<String, dynamic>? meta;
  @JsonKey(name: 'entity_id')
  final String? entityId;

  AttachmentMetaEntity({
    this.url,
    this.format,
    this.size,
    this.duration,
    this.pageCount,
    this.ogTags,
    this.aspectRatio,
    this.width,
    this.height,
    this.meta,
    this.entityId,
  });

  factory AttachmentMetaEntity.fromJson(
          Map<String, dynamic> json, int attachmentType) =>
      _$AttachmentMetaEntityFromJson(json, attachmentType);

  Map<String, dynamic> toJson() => _$AttachmentMetaEntityToJson(this);
}
