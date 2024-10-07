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
      width: json['width'] as int?,
      height: json['height'] as int?,
      aspectRatio: json['aspect_ratio'] as double?,
      meta: attachtmentType == 5 ? json : json['meta'],
      ogTags: json['og_tags'] == null
          ? null
          : OgTagsEntity.fromJson(json['og_tags'] as Map<String, dynamic>),
      entityId: json['entity_id'] as String?,
      pollQuestion: json['title'] as String?,
      expiryTime: json['expiry_time'] as int?,
      pollOptions: json['options'] as List<String>?,
      multiSelectState: json['multiple_select_state'] as String?,
      pollType: json['poll_type'] as String?,
      multiSelectNo: json['multiple_select_number'] as int?,
      isAnonymous: json['is_anonymous'] as bool?,
      allowAddOption: json['allow_add_option'] as bool?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$AttachmentMetaEntityToJson(
    AttachmentMetaEntity instance) {
  Map<String, dynamic> attachmentMeta = {
    'url': instance.url,
    'format': instance.format,
    'size': instance.size,
    'duration': instance.duration,
    'page_count': instance.pageCount,
    'og_tags': instance.ogTags,
    'entity_id': instance.entityId,
    'title': instance.pollQuestion,
    'expiry_time': instance.expiryTime,
    'options': instance.pollOptions,
    'multiple_select_state': instance.multiSelectState,
    'poll_type': instance.pollType,
    'multiple_select_number': instance.multiSelectNo,
    'is_anonymous': instance.isAnonymous,
    'allow_add_option': instance.allowAddOption,
    'meta': instance.meta,
    'thumbnail_url': instance.thumbnailUrl,
  };
  return attachmentMeta;
}
