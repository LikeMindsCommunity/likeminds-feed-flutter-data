// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentEntity _$AttachmentEntityFromJson(Map<String, dynamic> json) =>
    AttachmentEntity(
      fileSize: json['file_size'] as String?,
      fileTypeString: json['file_type_S'] as String?,
      fileType: json['file_type'] as int,
      fileUrl: json['file_url'] as String?,
    );

Map<String, dynamic> _$AttachmentEntityToJson(AttachmentEntity instance) =>
    <String, dynamic>{
      'file_type': instance.fileType,
      'file_url': instance.fileUrl,
      'file_type_S': instance.fileTypeString,
      'file_size': instance.fileSize,
    };
