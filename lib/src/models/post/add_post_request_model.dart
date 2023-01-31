import 'package:feed_sdk/src/models/post/attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_post_request_model.g.dart';

class AddPostRequest {
  final String text;
  final String? feedroomId;
  final List<Attachment>? attachments;

  AddPostRequest({
    required this.text,
    required this.attachments,
    this.feedroomId,
  });

  factory AddPostRequest.fromEntity({required AddPostRequestEntity entity}) {
    return AddPostRequest(
      text: entity.text,
      attachments:
          entity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
    );
  }

  AddPostRequestEntity toEntity() {
    return AddPostRequestEntity(
      text: text,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class AddPostRequestEntity {
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'feedroom_id')
  final String? feedroomId;

  AddPostRequestEntity({
    required this.text,
    required this.attachments,
    this.feedroomId,
  });

  factory AddPostRequestEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostRequestEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostRequestEntityToJson(this);
}
