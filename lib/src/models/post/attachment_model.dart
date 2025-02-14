import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

part 'attachment_model.g.dart';

/// {@template lm_feed_attachment_model}
/// Represents an attachment with a specific type and metadata.
/// {@endtemplate}
class Attachment {
  /// The type of the attachment.
  final int attachmentType;

  /// The metadata associated with the attachment.
  final AttachmentMeta attachmentMeta;

  /// {@macro lm_feed_attachment_model}
  Attachment({
    required this.attachmentType,
    required this.attachmentMeta,
  });

  /// Creates an [Attachment] from an [AttachmentEntity].
  factory Attachment.fromEntity(AttachmentEntity entity) {
    return Attachment(
      attachmentType: entity.attachmentType,
      attachmentMeta: AttachmentMeta.fromEntity(entity.attachmentMetaEntity),
    );
  }

  /// Converts the [Attachment] to an [AttachmentEntity].
  AttachmentEntity toEntity() {
    return AttachmentEntity(
      attachmentType: attachmentType,
      attachmentMetaEntity: attachmentMeta.toEntity(),
    );
  }
}

/// Represents the entity of an attachment for JSON serialization.
@JsonSerializable()
class AttachmentEntity {
  /// The type of the attachment.
  @JsonKey(name: 'attachment_type')
  final int attachmentType;

  /// The metadata entity associated with the attachment.
  @JsonKey(name: 'attachment_meta')
  final AttachmentMetaEntity attachmentMetaEntity;

  /// Creates an [AttachmentEntity] instance.
  AttachmentEntity({
    required this.attachmentType,
    required this.attachmentMetaEntity,
  });

  /// Creates an [AttachmentEntity] from a JSON map.
  factory AttachmentEntity.fromJson(Map<String, dynamic> json) =>
      _$AttachmentEntityFromJson(json);

  /// Converts the [AttachmentEntity] to a JSON map.
  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);
}

/// Represents the metadata of an attachment.
class AttachmentMeta {
  /// The URL of the attachment.
  final String? url;

  final String? path;

  final Uint8List? bytes;

  /// The format of the attachment.
  final String? format;

  /// The size of the attachment.
  final int? size;

  /// The duration of the attachment.
  final int? duration;

  /// The page count of the attachment.
  final int? pageCount;

  /// The Open Graph tags associated with the attachment.
  final OgTags? ogTags;

  /// The height of the attachment.
  final int? height;

  /// The width of the attachment.
  final int? width;

  /// The aspect ratio of the attachment.
  final double? aspectRatio;

  /// Additional metadata associated with the attachment.
  final Map<String, dynamic>? meta;

  /// The entity ID of the attachment.
  final String? entityId;

  /// The poll question associated with the attachment.
  final String? pollQuestion;

  /// The expiry time of the attachment.
  final int? expiryTime;

  /// The poll options associated with the attachment.
  final List<String>? pollOptions;

  /// The multi-select state of the poll.
  final String? multiSelectState;

  /// The type of the poll.
  final String? pollType;

  /// The number of multi-select options allowed.
  final int? multiSelectNo;

  /// Indicates if the poll is anonymous.
  final bool? isAnonymous;

  /// Indicates if adding options to the poll is allowed.
  final bool? allowAddOption;

  /// The thumbnail URL of the attachment.
  final String? thumbnailUrl;

  /// Name of the attachment file.
  final String? name;

  /// Creates an [AttachmentMeta] instance.
  AttachmentMeta({
    this.url,
    this.path,
    this.bytes,
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
    this.pollQuestion,
    this.expiryTime,
    this.pollOptions,
    this.multiSelectState,
    this.pollType,
    this.multiSelectNo,
    this.isAnonymous,
    this.allowAddOption,
    this.thumbnailUrl,
    this.name,
  });

  /// Creates an [AttachmentMeta] from an [AttachmentMetaEntity].
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
      pollQuestion: entity.pollQuestion,
      expiryTime: entity.expiryTime,
      pollOptions: entity.pollOptions,
      multiSelectState: entity.multiSelectState,
      pollType: entity.pollType,
      multiSelectNo: entity.multiSelectNo,
      isAnonymous: entity.isAnonymous,
      allowAddOption: entity.allowAddOption,
      thumbnailUrl: entity.thumbnailUrl,
      name: entity.name,
    );
  }

  /// Converts the [AttachmentMeta] to an [AttachmentMetaEntity].
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
      pollQuestion: pollQuestion,
      expiryTime: expiryTime,
      pollOptions: pollOptions,
      multiSelectState: multiSelectState,
      pollType: pollType,
      multiSelectNo: multiSelectNo,
      isAnonymous: isAnonymous,
      allowAddOption: allowAddOption,
      thumbnailUrl: thumbnailUrl,
      name: name,
    );
  }
}

/// Represents the entity of attachment metadata for JSON serialization.
@JsonSerializable()
class AttachmentMetaEntity {
  /// The URL of the attachment.
  final String? url;

  /// The format of the attachment.
  final String? format;

  /// The size of the attachment.
  final int? size;

  /// The duration of the attachment.
  final int? duration;

  /// The page count of the attachment.
  @JsonKey(name: 'page_count')
  final int? pageCount;

  /// The Open Graph tags entity associated with the attachment.
  @JsonKey(name: 'og_tags')
  final OgTagsEntity? ogTags;

  /// The height of the attachment.
  final int? height;

  /// The width of the attachment.
  final int? width;

  /// The aspect ratio of the attachment.
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;

  /// Additional metadata associated with the attachment.
  final Map<String, dynamic>? meta;

  /// The entity ID of the attachment.
  @JsonKey(name: 'entity_id')
  final String? entityId;

  /// The poll question associated with the attachment.
  @JsonKey(name: 'title')
  final String? pollQuestion;

  /// The expiry time of the attachment.
  @JsonKey(name: 'expiry_time')
  final int? expiryTime;

  /// The poll options associated with the attachment.
  @JsonKey(name: 'options')
  final List<String>? pollOptions;

  /// The multi-select state of the poll.
  @JsonKey(name: 'multi_select_state')
  final String? multiSelectState;

  /// The type of the poll.
  @JsonKey(name: 'poll_type')
  final String? pollType;

  /// The number of multi-select options allowed.
  @JsonKey(name: 'multi_select_no')
  final int? multiSelectNo;

  /// Indicates if the poll is anonymous.
  @JsonKey(name: 'is_anonymous')
  final bool? isAnonymous;

  /// Indicates if adding options to the poll is allowed.
  @JsonKey(name: 'allow_add_option')
  final bool? allowAddOption;

  /// The thumbnail URL of the attachment.
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  /// Name of the attachment file.
  @JsonKey(name: 'name')
  final String? name;

  /// Creates an [AttachmentMetaEntity] instance.
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
    this.pollQuestion,
    this.expiryTime,
    this.pollOptions,
    this.multiSelectState,
    this.pollType,
    this.multiSelectNo,
    this.isAnonymous,
    this.allowAddOption,
    this.thumbnailUrl,
    this.name,
  });

  /// Creates an [AttachmentMetaEntity] from a JSON map.
  factory AttachmentMetaEntity.fromJson(
          Map<String, dynamic> json, int attachmentType) =>
      _$AttachmentMetaEntityFromJson(json, attachmentType);

  /// Converts the [AttachmentMetaEntity] to a JSON map.
  Map<String, dynamic> toJson() => _$AttachmentMetaEntityToJson(this);
}
