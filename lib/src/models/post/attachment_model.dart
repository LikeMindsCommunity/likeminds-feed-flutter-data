import 'package:json_annotation/json_annotation.dart';

part 'attachment_model.g.dart';

class Attachment {
  final int fileType;
  final String? fileUrl;
  final String? fileTypeString;
  final String? fileSize;

  Attachment(
      {required this.fileSize,
      required this.fileTypeString,
      required this.fileType,
      required this.fileUrl});
  factory Attachment.fromEntity({required AttachmentEntity entity}) {
    return Attachment(
        fileSize: entity.fileSize,
        fileType: entity.fileType,
        fileTypeString: entity.fileTypeString,
        fileUrl: entity.fileUrl);
  }

  AttachmentEntity toEntity() {
    return AttachmentEntity(
      fileSize: fileSize,
      fileType: fileType,
      fileTypeString: fileTypeString,
      fileUrl: fileUrl,
    );
  }
}

@JsonSerializable()
class AttachmentEntity {
  @JsonKey(name: 'file_type')
  final int fileType;
  @JsonKey(name: 'file_url')
  final String? fileUrl;
  @JsonKey(name: 'file_type_S')
  final String? fileTypeString;
  @JsonKey(name: 'file_size')
  final String? fileSize;

  AttachmentEntity(
      {required this.fileSize,
      required this.fileTypeString,
      required this.fileType,
      required this.fileUrl});

  factory AttachmentEntity.fromJson(Map<String, dynamic> data) =>
      _$AttachmentEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);
}
