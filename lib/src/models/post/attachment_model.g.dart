// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentEntity _$AttachmentEntityFromJson(Map<String, dynamic> json) =>
    AttachmentEntity(
      attachmentType: json['attachment_type'] as int,
      attachmentMetaEntity: AttachmentMetaEntity.fromJson(
          json['attachment_meta'] as Map<String, dynamic>,
          json['attachment_type'] as int),
    );

Map<String, dynamic> _$AttachmentEntityToJson(AttachmentEntity instance) =>
    <String, dynamic>{
      'attachment_type': instance.attachmentType,
      'attachment_meta': instance.attachmentMetaEntity,
    };

AttachmentMetaEntity _$AttachmentMetaEntityFromJson(
        Map<String, dynamic> json, int attachtmentType) =>
    AttachmentMetaEntity(
      url: json['url'] as String?,
      format: json['format'] as String?,
      size: json['size'] as int?,
      duration: json['duration'] as int?,
      pageCount: json['page_count'] as int?,
      width: json['width'] as double?,
      height: json['height'] as double?,
      aspectRatio: json['aspect_ratio'] as double?,
      meta: attachtmentType == 5 ? json : null,
      ogTags: json['og_tags'] == null
          ? null
          : OgTagsEntity.fromJson(json['og_tags'] as Map<String, dynamic>),
      entityId: json['entity_id'] as String?,
    );

Map<String, dynamic> _$AttachmentMetaEntityToJson(
    AttachmentMetaEntity instance) {
  Map<String, dynamic> attachmentMeta = instance.meta ??
      {
        'url': instance.url,
        'format': instance.format,
        'size': instance.size,
        'duration': instance.duration,
        'page_count': instance.pageCount,
        'og_tags': instance.ogTags,
        'entity_id': instance.entityId,
      };
  return attachmentMeta;
}
