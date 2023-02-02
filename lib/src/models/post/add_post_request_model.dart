import 'package:likeminds_feed/src/models/post/attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_post_request_model.g.dart';

class AddPostRequest {
  final String text;
  final int? feedroomId;
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
      feedroomId: entity.feedroomId,
    );
  }

  AddPostRequestEntity toEntity() {
    return AddPostRequestEntity(
      text: text,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      feedroomId: feedroomId,
    );
  }
}

@JsonSerializable()
class AddPostRequestEntity {
  final String text;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'feedroom_id')
  final int? feedroomId;

  AddPostRequestEntity({
    required this.text,
    required this.attachments,
    this.feedroomId,
  });

  factory AddPostRequestEntity.fromJson(Map<String, dynamic> data) =>
      _$AddPostRequestEntityFromJson(data);

  Map<String, dynamic> toJson() => _$AddPostRequestEntityToJson(this);
}
